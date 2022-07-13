#!/usr/bin/python3
import argparse
import os
import sys
from subprocess import Popen, PIPE, STDOUT

def read_args() -> tuple[str, str]:
  """
  Reads server and client name from the command line arguments and returns them as a tuple.
  :return: A tuple of the server_name and client_name
  """
  description = 'script/tool to save logs from an atmoz/sftp container and a sftpclient container'
  parser = argparse.ArgumentParser(description=description)
  parser.add_argument(
    '--server', 
    '-s', 
    type=str, 
    required=True, 
    dest='server_name', 
    help='server container name.'
  )
  parser.add_argument(
    '--client', 
    '-c', 
    type=str, 
    required=True, 
    dest='client_name', 
    help='client container name.'
  )

  args = parser.parse_args()
  server_name = str(args.server_name)
  client_name = str(args.client_name)

  return (server_name, client_name)


def get_logs(command: str) -> str:
  """
  It runs a command in the shell and returns the output
  
  :param command: the command to be executed
  :type command: str
  :return: the stdout of the command executed
  """
  print(f'starting to extract logs with the command: {command}')
  try:
    process = Popen(command, shell=True, stdout=PIPE, stderr=STDOUT)
    output = ''

    with process.stdout:
        for line in iter(process.stdout.readline, b''):
            str_line = line.decode("utf-8").strip()
            output += str_line + '\n'

    return output

  except:
    print('logs cannot be extracted')
    return None


def write_logs(path: str, content: str, append: bool = False) -> bool:
  """
  > This function takes in a path and content and writes the content to the file at the path
  
  :param path: the path to the file you want to write to
  :type path: str
  :param content: the content to be written to the file
  :type content: str
  :param append: if True, the content will be appended to the file. If False, the file will be
  overwritten, defaults to False
  :type append: bool (optional)
  :return: A boolean value
  """
  print(f'starting to write logs with the path: {path}')
  try:
    if not os.path.exists(path=path):
      open(path, "x")
    
    mode = 'a' if append else 'w'
    with open(path, mode) as file:
      file.write(content)
      return True
  
  except:
    print('logs could not be written')
    return False


def main():
  (server_name, client_name) = read_args()
  server_logs = get_logs(
    command=f'sudo docker logs --timestamps {server_name}')
  client_logs = get_logs(
    command=f'sudo docker exec {client_name} cat /var/log/sftp_connection.log')

  if server_logs == None:
    sys.tracebacklimit = -1
    raise Exception("something went wrong trying to read the server logs")

  if client_logs == None:
    sys.tracebacklimit = -1
    raise Exception("something went wrong trying to read the client logs")
  
  are_serverlogs_written = write_logs(path='./server.log', content=server_logs)
  are_clientlogs_written = write_logs(path='./client.log', content=client_logs)

  if not (are_serverlogs_written and are_clientlogs_written) :
    sys.tracebacklimit = -1
    raise Exception("an error occurred writing the logs and the files may have been partially written.")
  else:
    print('logs were saved successfully')


if __name__ == "__main__":
  main()
