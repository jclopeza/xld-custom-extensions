#!/bin/bash
echo "Ruta del fichero subido = ${deployed.file.path}"
echo "Propiedad del deployable = ${deployed.deployable.propertyDeployable}"
echo "Propiedad del container = ${deployed.container.propertyContainer}"
echo "Propiedad del host que aloja al container puppetPath = ${deployed.container.host.puppetPath}"
echo "Propiedad del deployed = ${deployed.propertyDeployed}"



###############################################################
# Caso 1. Estudio de una variable booleana
###############################################################
<#if deployed.deployable.propertyDeployable_boolean == true>
echo "La variable booleana es verdadera"
<#else>
echo "La variable booleana es falsa"
</#if>

###############################################################
# Caso 2. Estudio de si una variable está definida o no
###############################################################
<#if deployed.deployable.propertyDeployable_integer??>
echo "La variable integer esta definida y su valor es: ${deployed.deployable.propertyDeployable_integer}"
<#else>
echo "La variable integer no esta definida"
</#if>

###############################################################
# Caso 3. Comparación de un string de texto
###############################################################
<#if deployed.deployable.propertyDeployable_string == "cadena 1">
echo "La variable string vale cadena 1: aquí está su valor: ${deployed.deployable.propertyDeployable_string}"
<#else>
echo "La variable string vale otra cosa: ${deployed.deployable.propertyDeployable_string}"
</#if>

###############################################################
# Caso 4. Evaluamos un conjunto de Strings, set_of_string
###############################################################
<#list deployed.deployable.propertyDeployable_set_of_string as my_string>
    echo "Elemento de mi set_of_string = ${my_string}"
</#list>

###############################################################
# Caso 5. Evaluamos una lista de Strings, list_of_string
# Utilizando las listas, podemos determinar el orden en que
# se obtienen las mismas. Se pueden reordenar en la gui
###############################################################
<#list deployed.deployable.propertyDeployable_list_of_string as my_string>
    echo "Elemento de mi list_of_string = ${my_string}"
</#list>

###############################################################
# Caso 6. Evaluamos un map_string_string, accedemos a k y v
# Para esta funcionalidad hemos actualizado la libreria
# de freemarker, de la 2.3.23 a la 2.3.28
###############################################################
<#list deployed.deployable.propertyDeployable_map_string_string as key, value>
echo "Key = ${key}, Value = ${value}"
</#list>

###############################################################
# Caso 7. Evaluamos un map_string_string, accedemos a k
###############################################################
<#list deployed.deployable.propertyDeployable_map_string_string?keys as key>
echo "Key = ${key}"
</#list>

###############################################################
# Caso 8. Evaluamos un map_string_string, accedemos a v
###############################################################
<#list deployed.deployable.propertyDeployable_map_string_string?values as value>
echo "Value = ${value}"
</#list>

###############################################################
# Caso 9. Asignación de variables
###############################################################
<#assign myHash = { "name": "mouse", "price": 50 }>

###############################################################
# Caso 10. Accediendo a un tipo CI
###############################################################
echo "Accediendo a CI, latestVersion = ${deployed.deployable.propertyDeployable_ci.lastVersion}"

###############################################################
# Caso 11. Accediendo a todos los elementos de un tipo CI
###############################################################
<#list deployed.deployable.propertyDeployable_ci as key, value>
echo "Key = ${key}"
</#list>
