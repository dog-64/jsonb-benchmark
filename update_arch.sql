UPDATE actors
SET roles = jsonb_set(roles, '{role}', '"none"')
WHERE imdb_id IN
      (SELECT imdb_id
       FROM actors
       WHERE kind = 'arch'
         AND random_order > (RANDOM() * 10000000)::bigint
       LIMIT 1)
