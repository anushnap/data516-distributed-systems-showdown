SELECT AVG(r.averagerating), COUNT(*), tb.startyear
FROM title_basics tb
INNER JOIN ratings r ON r.tconst = tb.tconst
GROUP BY tb.startyear;