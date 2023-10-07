SELECT *
FROM actors
WHERE roles ->> 'role' = 'actor'
  AND kind = 'arch'
ORDER BY random_order
LIMIT 1;
