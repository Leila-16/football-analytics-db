<kbd>[RU Русская версия](#русская-версия)</kbd>  
<kbd>[ENG English Version](#english-version)</kbd>



<h3 align="right"><a name="русская-версия">Русская версия</a></h3>


# База данных и аналитика для сайта футбольной игры | SQL, Tableau

### Описание  
Проект разработан как дополнение к действующему виртуальному футбольному менеджеру [vfm-estadio.ru](http://vfm-estadio.ru). Суть игры — регулярные матчи, моделируемые с помощью алгоритмов и формул. Пользователи управляют своими командами и соревнуются между собой. Все игровые исходы зависят от характеристик игроков и логики, заложенной в формулах.  

**Цель проекта** — упростить расчеты внутри игры и улучшить понимание взаимосвязей между параметрами игроков с помощью аналитики и визуализации.


**Технический стек:**
- создание БД, генерация рандомных данных, аналитика - PostgreSQL на PhpPgAdmin
- описание структуры БД - dbdiagram.io
- визуализация - Tableau

---

### Структура проекта
- db_structure - [структура базы данных](https://dbdiagram.io/d/Damosha-67f938904f7afba184458506)
	- [SQL-скрипт для генерации структуры базы данных](db_structure/db_structure.sql)  
	- [визуализация структуры базы данных](db_structure/db_structure.png)  
	- [скрипт на DBML для генерации структуры БД](db_structure/db_structure.dbml.txt)

- sql_queries - запросы в sql
	- [запросы для создания таблиц в БД](sql_queries/create_tables.sql)
	- [запросы для генерации рандомных данных](sql_queries/sample_data.sql)
	- [аналитические запросы](sql_queries/analytics_queries.sql)

- visual - дашборды и аналитика - *в процессе*
  - /tableau_visual/tableau/ — отчеты и дашборды в Tableau  

---

### База данных 
Создано три основные таблицы:  
1. `Users` — информация о пользователях (id, email, тариф, активность и т.п.).  
2. `Players` — характеристики игроков (напр. физ. и псих. способности, дисциплина, возраст, потенциал и т.п.)  
3. `Clubs` - описание футбольных клубов

Также реализованы таблицы-справочники: `positions`, `specialisations`, `tariffs`, `user_types`, `working_legs`, `country` .

---

### SQL-Аналитика
В рамках проекта реализовано несколько аналитических кейсов:  
1. **Оценка потенциала игроков относительно среднего по позиции**  
   Сравнение potential игроков со средним по позиции, определение тех, чья оценка выше ожиданий.  
2. **Соответствие способностей позиции**  
   Расчет коэффициента соответствия ключевых характеристик (скорость, сила, выносливость) позиции.  
3. **Выявление слабых мест**  
   Анализ "проседающих" характеристик у игроков — по сравнению со средними по позиции.  
4. **Дисциплина против силы**  
   Идентификация игроков, которые обладают хорошими физическими данными, но низкой дисциплиной.  
5. **Идентификация симулянтов**  
   Поиск игроков с высокой склонностью к симуляциям (выше нормы для позиции).  
6. **Поиск замен среди игроков**  
   Поиск аналогов игроку с близкими значениями по ключевым характеристикам (speed, strength, endurance).


---

<h3 align="right"><a name="english-version">English Version</a></h3>

# Database and Analytics for a Footbal Game Website | SQL, Tableau

### Description  
The project was developed as an extension to the existing virtual football manager [vfm-estadio.ru](http://vfm-estadio.ru). The essence of the game is regular matches simulated using algorithms and formulas. Users manage their teams and compete with each other. All in-game outcomes depend on player characteristics and the logic embedded in the formulas.

**Project Goal** — o simplify in-game calculations and improve the understanding of relationships between player parameters through analytics and visualization.

**Tech Stack:**
- database creation, random data generation, analytics — PostgreSQL on PhpPgAdmin
- database structure description — dbdiagram.io
- visualization — Tableau
- 
---

### Project Structure
- db_structure - [database structure](https://dbdiagram.io/d/Damosha-67f938904f7afba184458506)
	- [SQL script for generating database structure](db_structure/db_structure.sql)  
	- [database structure visualization](db_structure/db_structure.png)  
	- [DBML script for generating database structure](db_structure/db_structure.dbml.txt)

- sql_queries
	- [queries for creating tables](sql_queries/create_tables.sql)
	- [queries for generating random data](sql_queries/sample_data.sql)
	- [analytical queries](sql_queries/analytics_queries.sql)

- visual - dashboards and analytics – *in progress*
  - /tableau_visual/tableau/ — reports and dashboards in Tableau

---

### About the Database
Three main tables have been created: 
1. `Users` — information about users (id, email, subscription plan, activity, etc.).  
2. `Players` — player characteristics (e.g. physical and mental abilities, discipline, age, potential, etc.)  
3. `Clubs` - descriptions of football clubs

Reference tables also implemented: `positions`, `specialisations`, `tariffs`, `user_types`, `working_legs`, `country` .

---

### SQL-Аналитика
The project includes several analytical cases:  
1. **Player Potential Assessment Relative to Positional Average**  
  Comparing players’ potential with the average for their position to identify those whose ratings exceed expectations.
2. **Skill-Position Fit**  
  Calculating the conformity coefficient between key attributes (speed, strength, endurance) and a player's position.
3. **Identifying Weak Spots**  
  Analyzing underperforming attributes in players by comparing them with positional averages.
4. **Discipline vs. Strength**  
 Identifying players with strong physical stats but low discipline.
5. **Identifying Divers (Simulation-Prone Players)**  
   Detecting players with a high tendency to simulate, exceeding positional norms.
6. **Finding Player Substitutes**  
  Searching for similar players with closely matching key characteristics (speed, strength, endurance).



