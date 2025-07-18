```dbml
Table Users {
  user_id int [pk, not null]
  email varchar(100) [unique, not null]
  password_hash text [unique, not null]
  created_at timestamp [not null]
  active boolean
  login text [unique, not null]
  user_type int
  tariff int
  club1_id int
  club2_id int
  club3_id int
}

Ref: Users.user_type > user_types.user_type_id  
Ref: Users.tariff > tariffs.tariff_id
Ref: Users.club1_id > Clubs.club_id
Ref: Users.club2_id > Clubs.club_id
Ref: Users.club3_id > Clubs.club_id



Table Players {
  player_id int [pk, not null]
  age int [not null]
  strength int [not null]
  potential int [not null]
  experience int [not null]
  working_leg_id int [not null]
  speed int [not null]
  endurance int [not null]
  injuries_exposure int [not null]
  roughness int [not null]
  discipline int [not null]
  simulation_tendency int [not null]
  leadership int [not null]
  versatility int [not null]
  adaptability int [not null]
  volition int [not null]
  ability_passing int
  ability_dribbling int
  ability_tackling int
  ability_interception int
  ability_heading int
  ability_shooting int
  ability_penalty_kick int
  ability_free_kick int
  ability_corner_kick int
  ability_penalty_saving int
  ability_cross_claiming int
  ability_reflexes int
  ability_goalkeeping int
  ability_one_on_one int
  mood int [not null]
  club_id int 
  player_name varchat(255)
  positions text
  player_salary int
   specialisation_id1 int [not null]
  specialisation_id2 int
  specialisation_id3 int
  teamwork_in_the_country int
  player_fitness int
  player_rest_days int
  player_trauma_days int
  player_fatigue int
  player_country int
}
 
Ref: Players.positions > positions.position_id  
Ref: Players.working_leg_id > working_legs.working_leg_id  
Ref: Players.club_id > Clubs.club_id  
Ref: Players.player_country > country.country_id  
Ref: Players.specialisation_id1 > specialisations.specialisation_id 
Ref: Players.specialisation_id2 > specialisations.specialisation_id 
Ref: Players.specialisation_id3 > specialisations.specialisation_id 



Table Clubs {
  club_id int [pk, not null]
  user_id int [not null]
  stadium_id int 
  stadium_name varchar(100)
  base_level smallint
  youth_school_level smallint
  actual_youth_school_level smallint
  coach_main smallint 
  coach_technique smallint
  coach_goalkeeping smallint
  coach_tactics smallint
  coach_physical smallint
  salary_main numeric(5,3)
  salary_technique numeric(5,3)
  salary_goalkeeping numeric(5,3)
  salary_tactics numeric(5,3)
  salary_physical numeric(5,3)
  finances bigint
  rating int
  strength_11 int 
  strength_14 int
  club_name varchar(100)
  doctor smallint
  doctor_salary numeric(5,3)
  club_estadio_id varchar(4)
  championship_division int
  club_country int
}

Ref: Clubs.user_id > Users.user_id  
Ref: Clubs.club_country > country.country_id  



//Справочные таблицы:
Table positions {
  position_id int [pk, not null]
  position_name varchar(2) [unique, not null]
}

Table specialisations {
  specialisation_id int [pk, not null]
  specialisation_name varchar [unique, not null]
}

Table tariffs {
  tariff_id int [pk, not null]
  tariff_name varchar(20) [unique, not null]
}

Table user_types {
  user_type_id int [pk, not null]
  type_name varchar(20) [unique, not null]
}

Table working_legs{
  working_leg_id int [pk, not null]
  working_leg_name varchar [unique, not null]
}

Table country{
  country_id int [pk]
  country_name varchar
}
```
