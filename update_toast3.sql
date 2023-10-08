UPDATE actors
SET roles = jsonb_set(roles, '{0,role}', '"none"')
WHERE imdb_id IN
      (SELECT imdb_id
       FROM actors
       WHERE kind = 'toast3'
         AND random_order > (RANDOM() * 10000000)::bigint
       LIMIT 1)
