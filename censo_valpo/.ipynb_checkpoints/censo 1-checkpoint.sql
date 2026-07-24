-- Total de personas por comuna --

SELECT c.nom_comuna, COUNT(p.p10comuna) AS conteo
FROM public.personas AS p
JOIN public.hogares AS h
ON p.hogar_ref_id = h.hogar_ref_id
JOIN public.viviendas AS v
ON h.vivienda_ref_id = v.vivienda_ref_id
JOIN public.zonas AS z
ON v.zonaloc_ref_id = z.zonaloc_ref_id
JOIN public.comunas AS c
ON z.codigo_comuna = c.codigo_comuna
GROUP BY c.nom_comuna
ORDER BY conteo  DESC

-- Total de personas por zona --


SELECT c.nom_comuna, z.geocodigo, COUNT (*) AS conteo
FROM public.personas AS p
JOIN public.hogares AS h
ON p.hogar_ref_id = h.hogar_ref_id
JOIN public.viviendas AS v
ON h.vivienda_ref_id = v.vivienda_ref_id
JOIN public.zonas AS z
ON v.zonaloc_ref_id = z.zonaloc_ref_id
JOIN public.comunas AS c
ON z.codigo_comuna = c.codigo_comuna
GROUP BY c.nom_comuna, z.geocodigo
ORDER BY conteo DESC

-- Poblacion menor de edad por comuna

SELECT c.nom_comuna, 
COUNT(*) FILTER (WHERE p.p09<18) AS conteo,
ROUND (((COUNT(*) FILTER (WHERE p.p09<18))*100.0/COUNT(*)),2) AS porcentaje
FROM public.personas AS p
JOIN public.hogares AS h
ON p.hogar_ref_id = h.hogar_ref_id
JOIN public.viviendas AS v
ON h.vivienda_ref_id = v.vivienda_ref_id
JOIN public.zonas AS z
ON v.zonaloc_ref_id = z.zonaloc_ref_id
JOIN public.comunas AS c
ON z.codigo_comuna = c.codigo_comuna
GROUP BY c.nom_comuna
ORDER BY porcentaje DESC

--  Total de profesionales por xona censal

SELECT c.nom_comuna, 
z.geocodigo, 
--COUNT (*) FILTER (where p.p15>=12 and p.p15<=14) AS profesionales,
ROUND (((COUNT(*) FILTER (WHERE p.p15>=12 and p.p15<=14))*100.0/COUNT(*)),2) AS porcentaje
FROM public.personas AS p
JOIN public.hogares AS h
ON p.hogar_ref_id = h.hogar_ref_id
JOIN public.viviendas AS v
ON h.vivienda_ref_id = v.vivienda_ref_id
JOIN public.zonas AS z
ON v.zonaloc_ref_id = z.zonaloc_ref_id
JOIN public.comunas AS c
ON z.codigo_comuna = c.codigo_comuna
GROUP BY c.nom_comuna, z.geocodigo
ORDER BY porcentaje  ASC

-- 


