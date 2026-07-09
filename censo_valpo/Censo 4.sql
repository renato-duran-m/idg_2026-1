SELECT c.nom_comuna, 
z.geocodigo, 
ROUND (((COUNT(*) FILTER (WHERE p.p15>=12 and p.p15<=14))*100.0/COUNT(*)),2) AS ptje_migrantes,
ROUND (((COUNT(*) FILTER (WHERE p.p12pais<>998))*100.0/COUNT(*)),2) AS por
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
ORDER BY porcentaje_migran ASC
