import os

log_file = "cron.log"
container_name = "croncontainer"
docker_command = f'docker cp {container_name}:/var/log/{log_file} .'
os.system(docker_command)

logs = []

with open(log_file, 'r', encoding='utf8') as f:
    for line in f.readlines():
        if "Last login:" in line:
            temp = line.split()
            log = 'Log from {} at {}'.format(temp[-1], temp[3:6]) 
            logs.append(log)

with open(r'ssh.log', 'w', encoding='utf8') as f:
    f.write('\n'.join(logs))