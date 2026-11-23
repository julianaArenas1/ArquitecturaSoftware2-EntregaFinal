# Arquitectura de Software 2 – Entrega final

Orquestación con Docker Compose de la solución distribuida:

```
bd-festivos (MongoDB) → api-festivos (Express) → api-calendario (Spring Boot, Onion) → bd-calendario (PostgreSQL)
```

## Ejecutar

```bash
docker compose up -d --build     # construye imágenes y levanta los 4 servicios
docker compose ps                # los 4 deben quedar "healthy"
docker compose down              # detener (conserva los datos en los volúmenes)
docker compose down -v           # detener y borrar los datos (re-ejecuta los scripts de inicio)
```

| Servicio | Puerto host → contenedor | URL |
|---|---|---|
| bd-festivos | 27018 → 27017 | – |
| api-festivos | 3040 → 3030 | http://localhost:3040/api-docs |
| bd-calendario | 5433 → 5432 | – |
| api-calendario | 8091 → 8081 | http://localhost:8091/swagger-ui/index.html |

Entre contenedores se usan los nombres de servicio (`api-festivos:3030`, `bd-calendario:5432`), nunca `localhost`.
Las variables se pueden personalizar copiando `.env.example` a `.env`.

## Prueba principal: calendario 2027

```bash
curl http://localhost:3040/api/festivos/obtener/2027      # festivos del año (API Festivos)
curl http://localhost:8091/api/calendario/generar/2027    # genera y guarda 365 días → true
curl http://localhost:8091/api/calendario/listar/2027     # consulta el calendario
docker exec bd-calendario psql -U postgres -d calendariolaboral -c "select count(*) from calendario;"
```
