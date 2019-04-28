#!/bin/bash

plugin=$1

####################################################
# Detenemos XL Deploy
####################################################
sudo /etc/init.d/xl-deploy stop

####################################################
# Borramos el plugin del directorio
####################################################
unlink /opt/xebialabs/xl-deploy-8.6.1-server/plugins/xld-$plugin-1.0.0.jar
rm /opt/xebialabs/plugins/xld-$plugin-1.0.0.jar

####################################################
# Compilamos el plugin
####################################################
cd /home/jcla/Projects/xld-custom-extensions/$plugin
jar cvf xld-$plugin-1.0.0.jar *

####################################################
# Movemos el plugin al directorio plugins
####################################################
mv xld-$plugin-1.0.0.jar /opt/xebialabs/plugins/

####################################################
# Creamos enlace simbolico
####################################################
cd /opt/xebialabs/xl-deploy-8.6.1-server/plugins
ln -s ../../plugins/xld-$plugin-1.0.0.jar xld-$plugin-1.0.0.jar

####################################################
# Reinicamos XL Deploy
####################################################
sudo /etc/init.d/xl-deploy start
