#!/bin/bash
version_xld=9.0.5
plugin=$1

display_help() {
    echo
    echo "Debe pasarse como parmetro el nombre del plugin"
    echo
    echo "   nombre del plugin: aar"
    echo "   directorio que debe existir: xld-aar-plugin"
    echo
}

####################################################
# Verificamos que existe el plugin
####################################################
[ -d /home/jcla/Projects/xld-custom-extensions/xld-${plugin}-plugin ] || {
    display_help
    exit 1
}

####################################################
# Detenemos XL Deploy
####################################################
# sudo service xl-deploy stop

####################################################
# Borramos el plugin del directorio
####################################################
rm /opt/xebialabs/xl-deploy-${version_xld}-server/plugins/xld-${plugin}-plugin-1.0.0.jar
rm /opt/xebialabs/plugins/xld-${plugin}-plugin-1.0.0.jar

####################################################
# Compilamos el plugin
####################################################
cd /home/jcla/Projects/xld-custom-extensions/xld-${plugin}-plugin
jar cvf xld-${plugin}-plugin-1.0.0.jar *

####################################################
# Movemos el plugin al directorio plugins
####################################################
mv xld-${plugin}-plugin-1.0.0.jar /opt/xebialabs/plugins/

####################################################
# Creamos enlace simbolico
####################################################
cd /opt/xebialabs/xl-deploy-${version_xld}-server/plugins
cp /opt/xebialabs/plugins/xld-${plugin}-plugin-1.0.0.jar /opt/xebialabs/xl-deploy-${version_xld}-server/plugins/

####################################################
# Reinicamos XL Deploy
####################################################
# sudo service xl-deploy start
