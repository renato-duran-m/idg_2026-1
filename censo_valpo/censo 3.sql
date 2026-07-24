--Porcentaje dr viviendas hacinadas

CREATE TABLE output.porcentaje_hacinamiento AS 
SELECT c.nom_comuna, z.geocodigo, COUNT(*)          
FILTER (WHERE ind_hacin_rec = 3 or ind_hacin_rec = 4)
 * 100.0 / COUNT(*)  
AS porcentaje          
FROM personas AS p                    
JOIN hogares AS h                    
ON p.hogar_ref_id = h.hogar_ref_id    
JOIN viviendas AS v
ON h.vivienda_ref_id = v.vivienda_ref_id
JOIN zonas AS z
ON v.zonaloc_ref_id = z.zonaloc_ref_id
JOIN comunas AS c
ON z.codigo_comuna = c.codigo_comuna
GROUP BY z.geocodigo, c.nom_comuna
ORDER BY porcentaje DESC;

CREATE TABLE output.porcentaje_hacinamiento_geom AS  
(
SELECT shp.geom, tabla.*                
FROM output.porcentaje_hacinamiento AS tabla        
JOIN dpa.zonas_censales_v AS shp
ON tabla.geocodigo::DOUBLE PRECISION = shp.geocodigo);