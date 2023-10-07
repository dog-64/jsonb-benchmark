SELECT *
FROM actors
WHERE roles ->> 'role' = 'actor'
  AND kind = 'toast3'
ORDER BY random_order
LIMIT 1;
