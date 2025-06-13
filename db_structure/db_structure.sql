CREATE TABLE "Users" (
  "user_id" int PRIMARY KEY NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "password_hash" text UNIQUE NOT NULL,
  "created_at" timestamp NOT NULL,
  "active" boolean,
  "login" text UNIQUE NOT NULL,
  "user_type" int,
  "tariff" int,
  "club1_id" int,
  "club2_id" int,
  "club3_id" int
);

CREATE TABLE "Players" (
  "player_id" int PRIMARY KEY NOT NULL,
  "age" int NOT NULL,
  "strength" int NOT NULL,
  "potential" int NOT NULL,
  "experience" int NOT NULL,
  "working_leg_id" int NOT NULL,
  "speed" int NOT NULL,
  "endurance" int NOT NULL,
  "injuries_exposure" int NOT NULL,
  "roughness" int NOT NULL,
  "discipline" int NOT NULL,
  "simulation_tendency" int NOT NULL,
  "leadership" int NOT NULL,
  "versatility" int NOT NULL,
  "adaptability" int NOT NULL,
  "volition" int NOT NULL,
  "ability_passing" int,
  "ability_dribbling" int,
  "ability_tackling" int,
  "ability_interception" int,
  "ability_heading" int,
  "ability_shooting" int,
  "ability_penalty_kick" int,
  "ability_free_kick" int,
  "ability_corner_kick" int,
  "ability_penalty_saving" int,
  "ability_cross_claiming" int,
  "ability_reflexes" int,
  "ability_goalkeeping" int,
  "ability_one_on_one" int,
  "mood" int NOT NULL,
  "club_id" int,
  "player_name" varchat(255),
  "positions" text,
  "player_salary" int,
  "specialisation_id1" int NOT NULL,
  "specialisation_id2" int,
  "specialisation_id3" int,
  "teamwork_in_the_country" int,
  "player_fitness" int,
  "player_rest_days" int,
  "player_trauma_days" int,
  "player_fatigue" int,
  "player_country" int
);

CREATE TABLE "Clubs" (
  "club_id" int PRIMARY KEY NOT NULL,
  "user_id" int NOT NULL,
  "stadium_id" int,
  "stadium_name" varchar(100),
  "base_level" smallint,
  "youth_school_level" smallint,
  "actual_youth_school_level" smallint,
  "coach_main" smallint,
  "coach_technique" smallint,
  "coach_goalkeeping" smallint,
  "coach_tactics" smallint,
  "coach_physical" smallint,
  "salary_main" numeric(5,3),
  "salary_technique" numeric(5,3),
  "salary_goalkeeping" numeric(5,3),
  "salary_tactics" numeric(5,3),
  "salary_physical" numeric(5,3),
  "finances" bigint,
  "rating" int,
  "strength_11" int,
  "strength_14" int,
  "club_name" varchar(100),
  "doctor" smallint,
  "doctor_salary" numeric(5,3),
  "club_estadio_id" varchar(4),
  "championship_division" int,
  "club_country" int
);


CREATE TABLE "positions" (
  "position_id" int PRIMARY KEY NOT NULL,
  "position_name" varchar(2) UNIQUE NOT NULL
);

CREATE TABLE "specialisations" (
  "specialisation_id" int PRIMARY KEY NOT NULL,
  "specialisation_name" varchar UNIQUE NOT NULL
);

CREATE TABLE "tariffs" (
  "tariff_id" int PRIMARY KEY NOT NULL,
  "tariff_name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "user_types" (
  "user_type_id" int PRIMARY KEY NOT NULL,
  "type_name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "working_legs" (
  "working_leg_id" int PRIMARY KEY NOT NULL,
  "working_leg_name" varchar UNIQUE NOT NULL
);

CREATE TABLE "country" (
  "country_id" int PRIMARY KEY,
  "country_name" varchar
);


ALTER TABLE "Users" ADD FOREIGN KEY ("user_type") REFERENCES "user_types" ("user_type_id");
ALTER TABLE "Users" ADD FOREIGN KEY ("tariff") REFERENCES "tariffs" ("tariff_id");
ALTER TABLE "Users" ADD FOREIGN KEY ("club1_id") REFERENCES "Clubs" ("club_id");
ALTER TABLE "Users" ADD FOREIGN KEY ("club2_id") REFERENCES "Clubs" ("club_id");
ALTER TABLE "Users" ADD FOREIGN KEY ("club3_id") REFERENCES "Clubs" ("club_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("positions") REFERENCES "positions" ("position_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("working_leg_id") REFERENCES "working_legs" ("working_leg_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("club_id") REFERENCES "Clubs" ("club_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("player_country") REFERENCES "country" ("country_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("specialisation_id1") REFERENCES "specialisations" ("specialisation_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("specialisation_id2") REFERENCES "specialisations" ("specialisation_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("specialisation_id3") REFERENCES "specialisations" ("specialisation_id");
ALTER TABLE "Clubs" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");
ALTER TABLE "Clubs" ADD FOREIGN KEY ("club_country") REFERENCES "country" ("country_id");
