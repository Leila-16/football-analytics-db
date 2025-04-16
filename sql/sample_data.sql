
-- Создание 10 пользователей
INSERT INTO Users (username, email, password_hash, created_at, user_type, active, tariff, login)
SELECT
    'user_' || g || '_' || floor(random() * 1000),     -- уникальное имя пользователя с добавлением случайного числа
    'user_' || g || '@example.com',                    -- уникальный email
    md5(random()::text),                               -- псевдо-хеш пароля
    now(),                                             -- текущая дата и время
    1,                                                 -- фиксированное значение для user_type (integer)
    true,                                              -- активен
    floor(random() * 3) + 1,                           -- случайный тариф (1, 2 или 3)
    'login_' || g || '_' || floor(random() * 1000)     -- уникальный логин с добавлением случайного числа
FROM generate_series(1, 10) g;                         -- генерирация 10 пользователей



-- Создание игроков со случайными данными (10 для каждого пользователя)
INSERT INTO Players (
    user_id, position_id, age, strength, potential, experience, 
    specialisation_id, working_leg_id, 
    speed, endurance, injuries_exposure, roughness, discipline, 
    simulation_tendency, leadership, versatility, adaptability, volition,
    ability_pass, ability_dribbling, ability_otbor, ability_perehvat, 
    ability_igra_golovoy, ability_udar, ability_udar_s_penalty, 
    ability_shtrafnye, ability_uglovye, ability_otrazheniye_penalty, 
    ability_igra_na_vyhode, ability_reakciya, ability_vratarskaya_technika, 
    ability_vyhody_1na1, mood
)
SELECT
    u.user_id,
    floor(random() * 5 + 1)::int,         -- position_id (1-5)
    floor(random() * 30 + 15)::int,       -- age (15+)
    floor(random() * 100 + 1)::int,       -- strength (>=1)
    floor(random() * 100 + 1)::int,       -- potential (>=1)
    floor(random() * 50 + 1)::int,        -- experience (>=1)
    floor(random() * 5 + 1)::int,         -- specialisation_id (1-5)
    floor(random() * 5 + 1)::int,         -- working_leg_id (1-5)
    
    floor(random() * 20 + 1)::int,        -- speed
    floor(random() * 20 + 1)::int,        -- endurance
    floor(random() * 20 + 1)::int,        -- injuries_exposure
    floor(random() * 20 + 1)::int,        -- roughness
    floor(random() * 20 + 1)::int,        -- discipline
    floor(random() * 20 + 1)::int,        -- simulation_tendency
    floor(random() * 20 + 1)::int,        -- leadership
    floor(random() * 20 + 1)::int,        -- versatility
    floor(random() * 20 + 1)::int,        -- adaptability
    floor(random() * 20 + 1)::int,        -- volition

    floor(random() * 4)::int,             -- ability_pass (0-3)
    floor(random() * 4)::int,             -- ability_dribbling
    floor(random() * 4)::int,             -- ability_otbor
    floor(random() * 4)::int,             -- ability_perehvat
    floor(random() * 4)::int,             -- ability_igra_golovoy
    floor(random() * 4)::int,             -- ability_udar
    floor(random() * 4)::int,             -- ability_udar_s_penalty
    floor(random() * 4)::int,             -- ability_shtrafnye
    floor(random() * 4)::int,             -- ability_uglovye
    floor(random() * 4)::int,             -- ability_otrazheniye_penalty
    floor(random() * 4)::int,             -- ability_igra_na_vyhode
    floor(random() * 4)::int,             -- ability_reakciya
    floor(random() * 4)::int,             -- ability_vratarskaya_technika
    floor(random() * 4)::int,             -- ability_vyhody_1na1

    floor(random() * 31 - 15)::int        -- mood (-15 to 15)
FROM Users u, generate_series(1, 30);