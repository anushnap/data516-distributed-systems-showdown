SELECT p.job, tb.primarytitle, MIN(r.averagerating), MAX(r.averagerating), AVG(r.averagerating)
FROM principals p
INNER JOIN title_basics tb ON tb.tconst = p.tconst
INNER JOIN ratings r ON r.tconst = tb.tconst
WHERE p.category = 'producer'
GROUP BY p.job, tb.primarytitle;