SELECT *
FROM actors
WHERE roles ->> 'role' = 'actor'
  AND kind = 'table'
ORDER BY random_order
LIMIT 1;
