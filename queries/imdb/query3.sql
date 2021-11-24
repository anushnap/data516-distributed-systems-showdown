SELECT nb.primaryname, tb.startyear, tb.genres, MIN(r.averagerating), MAX(r.averagerating), AVG(r.averagerating)
FROM principals p
INNER JOIN name_basics nb ON nb.nconst = p.nconst
INNER JOIN title_basics tb ON tb.tconst = p.tconst
INNER JOIN ratings r ON r.tconst = tb.tconst
WHERE p.category = 'producer'
GROUP BY nb.primaryname, tb.startyear, tb.genres;