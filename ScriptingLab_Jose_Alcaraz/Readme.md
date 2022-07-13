![N|Solid](https://media-exp2.licdn.com/dms/image/C4E0BAQEhqEYDn2-LkA/company-logo_100_100/0/1580391093627?e=1663200000&v=beta&t=EO7vueG3ailmZ1RfTbu4knkfQGiqf5LZa1RJ90nt5do)

# DevOps Crash course
## Git Laboratory - Scripting and Programming

<br>

### SSH Node
El archivo necesario para la creación del contenedor que aloja el servicio de SFTP se encuentra en la carpeta 📁 **node-sftp**. En su interior se creó un script bash llamado 📄deploy-sftp.sh:

Para la configuración del contendor que aloja el servicio de SFTP se debe tener en cuenta lo siguiente:

- El puerto por el que se expone el servicio es configurable mediante la variable containerport, por favor asegurarse que el puerto a utilizar este libre en el host:


![image info](./images/containerport.png)

- Para este despliegue de sftp de demostración se utiliza el usuario root, por lo que en la configuración debe configurarse una contraseña personalizada.

![image info](./images/sftp-pass.png)

---
<br>

### Client Node
Los archivos necesarios para la creación del contenedor que aloja el cliente que se conectará al servicio SFTP se encuentra en la carpeta 📁 **node-client**. En su interior se creó un script bash llamado 📄deploy-client.sh, un archivo de configuración de crontab del usuario 📄root y un script de python que realiza la conexión a SFTP y la gestión de log 📄connectionsftp

Para la configuración de la conexión al servicio SFTP se debe tener en cuenta lo siguiente:

- La conexión al servicio se realiza por defecto cada diez minutos (configuración crontab)

![image info](./images/crontab.png)


- Es necesario configurar en el script de python connectionsftp la dirección ip del contenedor que aloja el servicio de SFTP, así como las credenciales del usuario que se conectará:

![image info](./images/credentials.png)

- La gestión de logs se está realizando mediante el módulo de python paramiko en un archivo nombrado 📄connsftp.log

![image info](./images/logs.png)

---

### Homework by [Jose Alcaraz](https://github.com/JoseAlcarazA "Jose Alcaraz")

---
<br>

![N|Solid](https://mms.businesswire.com/media/20211116006314/es/832960/4/SoftServe_Logo_2.jpg)

---
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Stat