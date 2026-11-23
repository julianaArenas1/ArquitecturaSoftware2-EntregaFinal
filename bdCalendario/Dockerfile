FROM postgres:16

# Los scripts de este directorio se ejecutan en orden alfabético solo en el primer arranque
# (volumen vacío): primero el DDL (estructura) y luego el DML (datos).
COPY ["DDL - Calendario Laboral.sql", "/docker-entrypoint-initdb.d/1-DDL.sql"]
COPY ["DML - Calendario Laboral.sql", "/docker-entrypoint-initdb.d/2-DML.sql"]
