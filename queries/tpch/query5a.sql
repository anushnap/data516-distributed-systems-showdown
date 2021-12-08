SELECT YEAR(l.l_shipdate), AVG(l.l_extendedprice) AS avg_cost, MIN(l.l_extendedprice) AS min_cost, 
MAX(l.l_extendedprice) as max_cost, SUM(l.l_extendedprice) AS cost_sum
FROM lineitem l
INNER JOIN part p ON p.p_partkey = l.l_partkey
INNER JOIN supplier s ON s.s_suppkey = l.l_suppkey
INNER JOIN orders o ON o.o_orderkey = l.l_orderkey
INNER JOIN nation n ON n.n_nationkey = s.s_nationkey
INNER JOIN region r ON r.r_regionkey = n.n_regionkey
WHERE l.l_quantity > 48
GROUP BY YEAR(l.l_shipdate);