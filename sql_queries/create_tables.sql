--Создание справочных таблиц----------------------------->>
CREATE TABLE positions (
   position_id SERIAL PRIMARY KEY,
   position_name VARCHAR(2) NOT NULL UNIQUE
);

INSERT INTO positions (position_name) VALUES
('GK'), ('SW'), ('LD'), ('CD'), ('RD'), ('LB'), ('DM'), ('RB'),
('LM'), ('CM'), ('RM'), ('LW'), ('AM'), ('RW'), ('ST');



CREATE TABLE specialisations (
   specialisation_id SERIAL PRIMARY KEY,
   specialisation_name VARCHAR NOT NULL UNIQUE
);

INSERT INTO specialisations (specialisation_name) VALUES
('вингер'), ('плеймейкер'), ('суперсаб'), ('свободный художник'), ('box-to-box'),
('бровочник'), ('персональщик'), ('дриблер'), ('командный игрок'), ('наконечник атак'),
('дальнобойщик'), ('атлет'), ('непредсказуемый'), ('любитель публики'), ('амбициозный'),
('незаметный'), ('кубковый боец'), ('провокатор'), ('гроза угловых'), ('чистильщик'), ('кошка');



CREATE TABLE tariffs (
   tariff_id SERIAL PRIMARY KEY,
   tariff_name VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO tariffs (tariff_name) VALUES
('basic'), ('standard'), ('premium');



CREATE TABLE user_types (
   user_type_id SERIAL PRIMARY KEY,
   user_type_name VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO user_types (user_type_name) VALUES
('user'), ('admin'), ('other');



CREATE TABLE working_legs (
   working_leg_id SERIAL PRIMARY KEY,
   working_leg_name VARCHAR NOT NULL UNIQUE
);

INSERT INTO working_legs (working_leg_name) VALUES
('левая'), ('правая'), ('обе'), ('только левая'), ('только правая');


--Создание таблицы Users------------------------->>
CREATE TABLE Users (
   user_id SERIAL PRIMARY KEY,
   username VARCHAR(50) NOT NULL UNIQUE,
   email VARCHAR(100) NOT NULL UNIQUE,
   password_hash TEXT NOT NULL,
   created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
   active BOOLEAN,
   login TEXT NOT NULL UNIQUE,
   user_type INTEGER REFERENCES user_types(user_type_id),
   tariff INTEGER REFERENCES tariffs(tariff_id)
);


--Создание таблицы Players----------------------------->>
CREATE TABLE Players (
   player_id SERIAL PRIMARY KEY,
   user_id INTEGER NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
   position_id INTEGER NOT NULL REFERENCES positions(position_id),
   age INTEGER NOT NULL CHECK(age >= 15),
   strength INTEGER NOT NULL CHECK(strength >= 1),
   potential INTEGER NOT NULL CHECK(potential >= 1),
   experience INTEGER NOT NULL CHECK(experience >= 1),
   specialisation_id INTEGER NOT NULL REFERENCES specialisations(specialisation_id),
   working_leg_id INTEGER NOT NULL REFERENCES working_legs(working_leg_id),
   speed INTEGER NOT NULL CHECK(speed BETWEEN 1 AND 20),
   endurance INTEGER NOT NULL CHECK(endurance BETWEEN 1 AND 20),
   injuries_exposure INTEGER NOT NULL CHECK(injuries_exposure BETWEEN 1 AND 20),
   roughness INTEGER NOT NULL CHECK(roughness BETWEEN 1 AND 20),
   discipline INTEGER NOT NULL CHECK(discipline BETWEEN 1 AND 20),
   simulation_tendency INTEGER NOT NULL CHECK(simulation_tendency BETWEEN 1 AND 20),
   leadership INTEGER NOT NULL CHECK(leadership BETWEEN 1 AND 20),
   versatility INTEGER NOT NULL CHECK(versatility BETWEEN 1 AND 20),
   adaptability INTEGER NOT NULL CHECK(adaptability BETWEEN 1 AND 20),
   volition INTEGER NOT NULL CHECK(volition BETWEEN 1 AND 20),
   ability_pass INTEGER DEFAULT 0 CHECK(ability_pass BETWEEN 0 AND 3),
   ability_dribbling INTEGER DEFAULT 0 CHECK(ability_dribbling BETWEEN 0 AND 3),
   ability_otbor INTEGER DEFAULT 0 CHECK(ability_otbor BETWEEN 0 AND 3),
   ability_perehvat INTEGER DEFAULT 0 CHECK(ability_perehvat BETWEEN 0 AND 3),
   ability_igra_golovoy INTEGER DEFAULT 0 CHECK(ability_igra_golovoy BETWEEN 0 AND 3),
   ability_udar INTEGER DEFAULT 0 CHECK(ability_udar BETWEEN 0 AND 3),
   ability_udar_s_penalty INTEGER DEFAULT 0 CHECK(ability_udar_s_penalty BETWEEN 0 AND 3),
   ability_shtrafnye INTEGER DEFAULT 0 CHECK(ability_shtrafnye BETWEEN 0 AND 3),
   ability_uglovye INTEGER DEFAULT 0 CHECK(ability_uglovye BETWEEN 0 AND 3),
   ability_otrazheniye_penalty INTEGER DEFAULT 0 CHECK(ability_otrazheniye_penalty BETWEEN 0 AND 3),
   ability_igra_na_vyhode INTEGER DEFAULT 0 CHECK(ability_igra_na_vyhode BETWEEN 0 AND 3),
   ability_reakciya INTEGER DEFAULT 0 CHECK(ability_reakciya BETWEEN 0 AND 3),
   ability_vratarskaya_technika INTEGER DEFAULT 0 CHECK(ability_vratarskaya_technika BETWEEN 0 AND 3),
   ability_vyhody_1na1 INTEGER DEFAULT 0 CHECK(ability_vyhody_1na1 BETWEEN 0 AND 3),
   mood INTEGER NOT NULL DEFAULT 0 CHECK(mood BETWEEN -15 AND 15)
);
