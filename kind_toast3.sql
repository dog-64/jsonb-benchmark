SELECT roles[0] -> 'role'
FROM actors
WHERE kind = 'toast3'
  AND random_order > (RANDOM() * 10000000)::bigint
LIMIT 1;
