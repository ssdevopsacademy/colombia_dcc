import sys
import docker
from datetime import datetime
client = docker.from_env()
container_names = ['sftpcontainer']
wordLogs = ("Accepted", "Received", "Disconnected", "Invalid", "NOUSER", "user", "password")

dt = datetime.utcnow().strftime("%Y-%m-%d-%H-%M-%s")
file_path = 'logSftp.log'
filename = f"task3-{dt}.log"
sys.stdout = open(filename, "w")
def main():
        for container_name in container_names:
            dkg = client.containers.get(container_name).logs(stream = True, follow = False, timestamps=True, stdout=True, stderr=True)
            try:
              while True:
                line = next(dkg).decode("utf-8")
                if any(s in line for s in wordLogs):
                   print(line)
            except StopIteration:
              print(f'log stream ended for {container_name}')


if __name__ == '__main__':
    main()
