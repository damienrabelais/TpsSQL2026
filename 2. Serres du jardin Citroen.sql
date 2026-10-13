-- 1. Lister toutes les plantes, avec affichage de tous les champs.
SELECT *
FROM PLANTE

-- 2. Lister les plantes (n°, nom) dont le nom commence par R
SELECT nomplante
FROM PLANTE
WHERE nomplante LIKE 'R%'

-- 3. Lister les plantes (noms), sans doublon
SELECT DISTINCT nomplante
FROM PLANTE

-- 4. Lister les plantes (noms) de la région n°6
SELECT nomplante
FROM PLANTE
WHERE noregion = 6;

-- 5. Lister les régions (noms) par ordre alphabétique descendant
SELECT nomregion
FROM REGION
ORDER BY nomregion DESC;

-- 6. Afficher le nombre de serres dans le jardin (= la base) (avec colonne 'renommée')
SELECT count(*) as "Nombre de serres"
FROM SERRE

-- 7. Afficher le nombre de bananier dans le jardin (avec colonne 'renommée')
SELECT count(*) as "Nombre de bananier"
FROM PLANTE
WHERE nomplante='Bananier'

-- 8. Afficher le nombre de plantes pour chaque région (n° région), dans la base
SELECT noregion, count(*) as "Nombre de plantes"
FROM PLANTE
GROUP BY noregion;

-- 9. Lister les régions (n°) représentées par plus de 2 plantes dans le jardin (HAVING)
SELECT noregion, count(*) as "Nombre de plantes"
FROM PLANTE
GROUP BY noregion
HAVING count(*) > 2;

-- 10. Lister les plantes (noms) avec, à côté, leur région d'origine (nom) (jointure simple)
SELECT nomplante,nomregion
FROM PLANTE
INNER JOIN REGION on (PLANTE.noregion=REGION.noregion)

-- 11. Lister les régions d'origine (noms), et plantes (noms) (jointure simple). Les résultats seront triés sur le nom de la région, puis le nom des plantes.
SELECT nomregion, nomplante
FROM PLANTE
INNER JOIN REGION ON (PLANTE.noregion=REGION.noregion)
ORDER BY nomregion, nomplante

-- 12. Lister les plantes (noms) de la serre n°3 (jointure simple). Les résultats seront triés sur le nom des plantes (alphabétique descendant).
SELECT nomplante
FROM PLANTE
INNER JOIN EMPLACEMENT ON (PLANTE.noplante = EMPLACEMENT.noplante)
WHERE noserre = 3
ORDER BY nomplante DESC;

-- 13. Lister les plantes (noms) d'Afrique (équatoriale et tropicale). La restriction sera obligatoirement faite sur le champ 'nomregion' : jointure simple). Les résultats seront triés sur le nom des plantes (tri alphabétique ascendant). Vous afficherez également le nom de la région d'origine de la plante 'à côté' du nom de la plante.
SELECT nomplante,nomregion
FROM PLANTE
INNER JOIN REGION ON (PLANTE.noregion = REGION.noregion)
WHERE nomregion LIKE 'Afrique%'
ORDER BY nomplante ASC;

-- 14. Afficher le nom des plantes de la serre Exoticus (recherche sur nom de la serre !) (Double jointure)
SELECT PLANTE.noplante, nomplante
FROM PLANTE
INNER JOIN EMPLACEMENT ON (PLANTE.noplante = EMPLACEMENT.noplante)
INNER JOIN SERRE ON (EMPLACEMENT.noserre = SERRE.noserre)
WHERE nomserre = 'Exoticus'
