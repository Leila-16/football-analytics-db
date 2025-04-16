CREATE TABLE "Users" (
  "user_id" int PRIMARY KEY NOT NULL,
  "username" varchar(50) UNIQUE NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "password_hash" text UNIQUE NOT NULL,
  "created_at" timestamp NOT NULL,
  "active" boolean,
  "login" text UNIQUE NOT NULL,
  "user_type" int,
  "tariff" int
);

CREATE TABLE "Players" (
  "player_id" int PRIMARY KEY NOT NULL,
  "user_id" int NOT NULL,
  "position_id" int NOT NULL,
  "age" int NOT NULL,
  "strength" int NOT NULL,
  "potential" int NOT NULL,
  "experience" int NOT NULL,
  "specialisation_id" int NOT NULL,
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
  "mood" int NOT NULL
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

ALTER TABLE "Users" ADD FOREIGN KEY ("user_type") REFERENCES "user_types" ("user_type_id");
ALTER TABLE "Users" ADD FOREIGN KEY ("tariff") REFERENCES "tariffs" ("tariff_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("position_id") REFERENCES "positions" ("position_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("specialisation_id") REFERENCES "specialisations" ("specialisation_id");
ALTER TABLE "Players" ADD FOREIGN KEY ("working_leg_id") REFERENCES "working_legs" ("working_leg_id");
