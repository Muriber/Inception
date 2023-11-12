<p>INCEPTION</p>
Este proyecto expande tu conocimiento en la administración de sistemas con Docker. Consiste en virtualizar varias imágenes de Docker, creándolas en una máquina virtual personal.
Para el desarrollo del sistema se usará Docker-Compose.
Para ello, es necesario implementar de forma individual para cada uno de los servicios su propio Dockerfiles. En el caso de este proyecto, cada Dockerfiles será llamado por el docker-compose.yml, y este a su vez por el Makefile.
Por lo tanto, se construye la propia imagen Docker del servicio a implementar y de acuerdo a las necesiadades, no utilizando las imagenes pre-establecidas que pueden estar disponibles en DockerHub, partiendo en todos los casos de un sistema Debian en el contenedor.
En resumen, se desarrolará:
• Un contenedor Docker que implementará NGINX con TLSv1.2 o TLSv1.3.
• Un contenedor Docker que implementará WordPress + php-fpm (siendo instalado y configurado) de forma individual, sin nginx.
• Un contenedor Docker que implementará MariaDB de forma individual, sin nginx.
• Un volumen que contendrá la BBDD WordPress.
• Un segundo volumen que contendrá los archivos web del WordPress.
• Una docker-network que establece las conexiones entre los contenedores. 
Todo este sistema se implementará mediante el Docker-Compose, reiniciándose en caso de fallo.

El diagrama de bloques de la implementación se corresponderiá con el siguiente:
<span>![</span><span>Diagrama de bloques contenedores</span><span>]</span><span>(</span>span>https://raw.githubusercontent.com/Muriber/Inception/master/img/esquema.png</span><span>)</span>
