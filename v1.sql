-- Заполнение БД тестовыми данными
-- когда разница размеров достигается длиной roles->title 

-- Удаление таблицы actors, если она существует
DROP TABLE IF EXISTS actors;

-- Создание таблицы actors
CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    height TEXT,
    imdb_id INT UNIQUE,
    roles JSONB,
    kind TEXT,
    random_order BIGINT
);

CREATE INDEX idx_kind_random_order ON actors (kind, random_order);

-- Вставка миллиона записей в таблицу actors
INSERT INTO actors (name, height, imdb_id, roles, kind)
SELECT 
    'Actor ' || i,  -- Генерация имени актера с помощью порядкового номера i
    (150 + (i % 50)) || ' cm',  -- Генерация высоты в диапазоне от 150 до 200 см
    1000000 + i,  -- Генерация уникального imdb_id, начиная с 1000001
    jsonb_build_object(  -- Создание объекта JSON для поля roles
        'role', 'actor',
        'title', substr(md5(random()::text), 1, 50) || ' (' || substr(md5(random()::text), 1, 50) || ')'
    ),
    'table'   -- roles размещены в самой таблице
FROM generate_series(1, 1000000) AS i;  -- Генерация последовательности чисел от 1 до 1000000
;

-- Вставка миллиона записей в таблицу actors
INSERT INTO actors (name, height, imdb_id, roles, kind)
SELECT 
    'Actor ' || i,  -- Генерация имени актера с помощью порядкового номера i
    (150 + (i % 50)) || ' cm',  -- Генерация высоты в диапазоне от 150 до 200 см
    2000000 + i,  -- Генерация уникального imdb_id, начиная с 1000001
    jsonb_build_object(  -- Создание объекта JSON для поля roles
        'role', 'actor',
        'title', 
        rpad(substr(md5(random()::text), 1, 32), 2064 - 62, substr(md5(random()::text), 1, 32)) ||         ')'
    ),
    'arch'   -- roles в архиве меньше 2048
FROM generate_series(1, 1000000) AS i;  -- Генерация последовательности чисел от 1 до 1000000
;
-- Вставка миллиона записей в таблицу actors
INSERT INTO actors (name, height, imdb_id, roles, kind)
SELECT 
    'Actor ' || i,  -- Генерация имени актера с помощью порядкового номера i
    (150 + (i % 50)) || ' cm',  -- Генерация высоты в диапазоне от 150 до 200 см
    3000000 + i,  -- Генерация уникального imdb_id, начиная с 1000001
    jsonb_build_object(  -- Создание объекта JSON для поля roles
        'role', 'actor',
        'title', 
        rpad(substr(md5(random()::text), 1, 32), 4096 - 62, substr(md5(random()::text), 1, 32)) ||         ')'
    ),
    'toast'   -- roles в toast
FROM generate_series(1, 1000000) AS i;  -- Генерация последовательности чисел от 1 до 1000000
;

--UPDATE actors SET random_order = floor(random() * 1000000)::INT;
--
--SELECT * FROM actors WHERE roles->>'role' = 'actor' AND kind = 'table' ORDER BY random_order LIMIT 1;
