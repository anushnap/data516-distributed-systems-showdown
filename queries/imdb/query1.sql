SELECT p.job, MIN(r.averagerating), MAX(r.averagerating), AVG(r.averagerating)
FROM principals p
INNER JOIN ratings r ON r.tconst = p.tconst
WHERE r.averagerating > 3
GROUP BY p.job;