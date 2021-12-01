SELECT YEAR(l.l_shipdate), s.s_name, p.p_name, AVG(l.l_extendedprice) AS avg_cost, MIN(l.l_extendedprice) AS min_cost, 
MAX(l.l_extendedprice) as max_cost, SUM(l.l_extendedprice) AS cost_sum
FROM lineitem l
INNER JOIN part p ON p.p_partkey = l.l_partkey
INNER JOIN supplier s ON s.s_suppkey = l.l_suppkey
INNER JOIN orders o on o.o_orderkey = l.l_orderkey
WHERE l.l_quantity > 48
GROUP BY YEAR(l.l_shipdate), s.s_name, p.p_name;