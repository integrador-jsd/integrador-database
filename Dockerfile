# Crear el contenedor desde la última versión oficial de la imagen
FROM mysql:5.7

# Agregar una base de datos
ENV MYSQL_DATABASE integrador

ENV MYSQL_ROOT_PASSWORD root

# Copiar los scripts al initdb.d
# Se ejecutan al iniciar el contenedor
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/