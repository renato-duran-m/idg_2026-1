SELECT * --Seleccionar todas las columnas
FROM "Artist"--desde que tabla

-- Seleccionar nombre y apellido de los clientes

SELECT "FirstName" AS "Nombre", "LastName" AS "Apellido"
FROM "Customer"

-- Seleccionar todos los clientes de Canada
SELECT *
FROM "Customer"
WHERE "Country" = 'Canada' -- Filtro
ORDER BY "LastName" DESC

-- Generar consulta que seleccione todos los empleados que trabajen como 'IT Staff', 
-- ordenados por su primer nombre

SELECT *
FROM "Employee"
WHERE "Title" = 'IT Staff'
ORDER BY "FirstName"

-- Generar consulta que contenga unicamente el nombre de la canción y su duración, 
-- ordenados según duración.

SELECT "Name", "Milliseconds"
FROM "Track"
ORDER BY "Milliseconds"

-- Contar total de clientes

SELECT COUNT(*) AS "Total Clientes"
FROM "Customer"


--Seleccionar número de clientes por país

SELECT "Country" AS "Pais",
COUNT(*) AS "Total Clientes"
FROM "Customer"
GROUP BY "Country"
ORDER BY "Total Clientes" DESC
LIMIT 3

--Selecciionar total de ventas por pais

SELECT "BillingCountry" AS "Pais",
SUM("Total")
FROM "Invoice"
GROUP BY "BillingCountry" 
ORDER BY "Pais" DESC
LIMIT 5

--Seleccionar albumes y sus artistas
 
SELECT al."Title" AS "Album", ar."Name" AS "Artista"
FROM "Artist" AS ar
JOIN "Album" AS al
ON ar."ArtistId" = al."ArtistId"
--Mostrar nombre de la pista, nombre del album y nombre del artista en orden alfabetico por artista
SELECT tr."Name" AS "Nombre písta", al."Title" AS "Album", ar."Name" AS "Artista"
FROM "Album" AS al
JOIN "Track" AS tr
ON tr."AlbumId" = al."AlbumId"
JOIN "Artist" AS ar
ON al."ArtistId" = ar."ArtistId"
ORDER BY "Artista"