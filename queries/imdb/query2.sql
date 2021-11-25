SELECT a.region, tb.startyear, AVG(tb.runtimeminutes) AS avg_runtime, AVG(r.averagerating), AVG(r.numvotes) as avg_votes
FROM title_basics tb
INNER JOIN ratings r ON r.tconst = tb.tconst
INNER JOIN akas a ON a.titleid = tb.tconst
WHERE tb.startyear > 1990 AND tb.runtimeminutes > 30
GROUP BY a.region, tb.startyear;