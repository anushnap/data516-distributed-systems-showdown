SELECT a.region, nb.primaryname, MIN(r.averagerating), MAX(r.averagerating), AVG(r.averagerating)
FROM principals p
INNER JOIN name_basics nb ON nb.nconst = p.nconst
INNER JOIN title_basics tb ON tb.tconst = p.tconst
INNER JOIN ratings r ON r.tconst = p.tconst
INNER JOIN akas a ON a.titleid = p.tconst
INNER JOIN crew c ON c.tconst = p.tconst
WHERE p.category = 'producer'
GROUP BY a.region, nb.primaryname;