SELECT *
FROM actors
WHERE roles ->> 'role' = 'actor'
  AND kind = 'toast'
ORDER BY random_order
LIMIT 1;
