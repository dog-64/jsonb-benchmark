SELECT roles ->> 'role'
FROM actors
WHERE kind = 'toast'
  AND random_order > (RANDOM() * 10000000)::bigint
LIMIT 1;
