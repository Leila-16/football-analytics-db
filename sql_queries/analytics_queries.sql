--1. Агрегированные показатели по игрокам:
  --position_match_score — насколько хорошо игрок подходит для своей позиции
  --major_weakness — на какую способность стоит обратить внимание
  --discipline_flag — сильные, но проблемные игроки
  --simulation_flag — возможные симулянты (выше нормы по позиции)

WITH position_averages AS (
  SELECT 
    position_id,
    ROUND(AVG(speed), 2) AS avg_speed,
    ROUND(AVG(endurance), 2) AS avg_endurance,
    ROUND(AVG(strength), 2) AS avg_strength,
    ROUND(AVG(discipline), 2) AS avg_discipline,
    ROUND(AVG(simulation_tendency), 2) AS avg_simulation
  FROM Players
  GROUP BY position_id
),

player_analysis AS (
  SELECT 
    p.player_id,
    p.position_id,
    p.age,
    p.discipline,
    p.simulation_tendency,
    p.speed,
    p.endurance,
    p.strength,
    pa.avg_speed,
    pa.avg_endurance,
    pa.avg_strength,
    pa.avg_discipline,
    pa.avg_simulation,
    
    -- соответствие позиции и способностей
    ROUND((p.speed - pa.avg_speed) + (p.endurance - pa.avg_endurance) + (p.strength - pa.avg_strength), 2) AS role_fit_score,

    -- слабые способности
    CASE 
      WHEN p.speed < pa.avg_speed - 2 THEN 'low speed'
      WHEN p.endurance < pa.avg_endurance - 2 THEN 'low endurance'
      WHEN p.strength < pa.avg_strength - 2 THEN 'low strength'
      ELSE NULL
    END AS major_weakness,

    -- плохая дисциплина, но сильные способности
    CASE 
      WHEN p.discipline < pa.avg_discipline - 3 AND 
           p.strength > pa.avg_strength + 2 THEN 'strong but undisciplined'
      ELSE NULL
    END AS discipline_flag,

    -- склонность к симуляциям, выше нормы
    CASE 
      WHEN p.simulation_tendency > pa.avg_simulation + 3 THEN 'diver'
      ELSE NULL
    END AS simulation_flag

  FROM Players p
  JOIN position_averages pa ON p.position_id = pa.position_id
)

SELECT 
  player_id,
  position_id,
  age,
  speed,
  endurance,
  strength,
  ROUND(role_fit_score, 2) AS position_match_score,
  major_weakness,
  discipline_flag,
  simulation_flag
FROM player_analysis
ORDER BY position_id, position_match_score DESC;



--2. Недооцененный игроки. Оценка потенциала игроков с учетом возраста 
--(игроки с высоким potential, но способностями ниже среднего для возрастной группы)
WITH avg_strength_by_position AS (
  SELECT 
    position_id,
    AVG(strength) AS avg_strength
  FROM Players
  GROUP BY position_id
)

SELECT 
  p.player_id,
  p.position_id,
  p.strength,
  ROUND(a.avg_strength, 2) AS avg_strength_by_position,
  ROUND(p.strength - a.avg_strength, 2) AS strength_gap,
  p.potential
FROM Players p
JOIN avg_strength_by_position a 
  ON p.position_id = a.position_id
WHERE 
  p.strength < a.avg_strength
  AND p.potential > 18
ORDER BY strength_gap ASC;


--3. Заменяемые игроки (которых можно заменить другими, с похожими характеристиками, но моложе и с меньшим травматизмом)
SELECT DISTINCT ON (p1.player_id)
  p1.player_id AS original_player,
  p2.player_id AS substitute_candidate,
  p2.position_id,
  p2.age,
  ROUND(ABS(p1.speed - p2.speed) + ABS(p1.endurance - p2.endurance) + ABS(p1.strength - p2.strength), 2) AS total_difference
FROM Players p1
JOIN Players p2 ON p1.player_id != p2.player_id
WHERE 
  ABS(p1.speed - p2.speed) <= 2 AND
  ABS(p1.endurance - p2.endurance) <= 2 AND
  ABS(p1.strength - p2.strength) <= 2 AND
  p1.position_id = p2.position_id -- сравннение игроков одинаковой позиции
ORDER BY p1.player_id, total_difference;



--4. Возрастная деградация навыков (после 30 лет физ. способности снижаются на 2%)
SELECT
  player_id,
  age,
  speed,
  endurance,
  strength,
  CASE 
    WHEN age <= 30 THEN speed
    ELSE ROUND(speed * (1 - 0.02 * (age - 30)), 2)
  END AS adjusted_speed,
  CASE 
    WHEN age <= 30 THEN endurance
    ELSE ROUND(endurance * (1 - 0.02 * (age - 30)), 2)
  END AS adjusted_endurance,
  CASE 
    WHEN age <= 30 THEN strength
    ELSE ROUND(strength * (1 - 0.02 * (age - 30)), 2)
  END AS adjusted_strength
FROM Players
WHERE age > 28
ORDER BY age DESC;



--5. Коэффициент полезности игрока (Speed 20%, Endurance 20%, Strength 15%, Leadership 10%, Discipline 10%, 
--Simulation tendency –10%, Injuries exposure –10%, Versatility 15%)
SELECT 
  player_id,
  name,
  ROUND(
    speed * 0.2 +
    endurance * 0.2 +
    strength * 0.15 +
    leadership * 0.1 +
    discipline * 0.1 -
    simulation_tendency * 0.1 -
    injuries_exposure * 0.1 +
    versatility * 0.15, 
  2) AS utility_score
FROM Players
ORDER BY utility_score DESC;
