REM Versión preliminar, lo ideal es que se obtenga la información de archivos de configuración
REM USO: crearOrg nombreAlias
REM: Crear org
REM sfdx force:org:create -v [devHubUserName] -s -f [config/project-scratch-def.json] -a [scratchOrgName]
sfdx force:org:create -s -f config/project-scratch-def.json -a %1

REM Instalar Paquetes:
REM Paquete Hierarchy
sfdx force:package:install --package 04t1a000000MzAgAAK -u %1 -w 30

REM Push del código
sfdx force:source:push -u %1

REM abrir org
sfedx force:org:open -u %1