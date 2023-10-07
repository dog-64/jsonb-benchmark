SELECT roles ->> 'role'
FROM actors
WHERE kind = 'arch'
  AND random_order > (RANDOM() * 10000000)::bigint
LIMIT 1;
