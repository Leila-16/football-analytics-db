# Data Analyst Portfolio Project

*eng version below

## ОПИСАНИЕ  
Проект разработан как дополнение к действующему виртуальному футбольному менеджеру [vfm-estadio.ru](http://vfm-estadio.ru). Суть игры — регулярные матчи, моделируемые с помощью алгоритмов и формул. Пользователи управляют своими командами и соревнуются между собой. Все игровые исходы зависят от характеристик игроков и логики, заложенной в формулах.  

Цель проекта — упростить расчеты внутри игры и улучшить понимание взаимосвязей между параметрами игроков с помощью аналитики и визуализации. Также проект служит частью портфолио для позиции Data Analyst.



## СТРУКТУРА ПРОЕКТА  
- `/sql/create_tables/` — SQL-скрипты создания таблиц в phpPgAdmin  
- `/sql/sample_data/` — SQL-скрипты для генерации случайных данных  
- `/sql/analytics_queries/` — аналитические SQL-запросы

- `/db_structure/db_structure.sql/` — SQL-скрипт для генерации структуры базы данных  
- `/db_structure/db_structure.png/` — визуализация структуры базы данных  
- `/db_structure/db_structure.dbml.txt/` — скрипт на DBML для генерации структуры базы
  
- `/excel_analysis/excel/` — сводные таблицы и визуализации в Excel  
- `/tableau_visual/tableau/` — отчеты и дашборды в Tableau  
- `README.md` — текущее описание проекта  



## БАЗА ДАННЫХ  
Создано две основные таблицы:  
1. `Users` — информация о пользователях (id, email, тариф, активность и т.п.).  
2. `Players` — характеристики игроков, включая:  
   - физические и психологические способности (скорость, сила, выносливость и др.);  
   - дисциплину и склонность к симуляциям;  
   - возраст, опыт и потенциал;  
   - привязку к позиции на поле.  

Также реализованы таблицы-справочники: `positions`, `specialisations`, `tariffs`, `user_types`, `working_legs`.



## SQL-АНАЛИТИКА  
В рамках проекта реализовано несколько бизнес-кейсов:  
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



## ИСПОЛЬЗУЕМЫЕ ТЕХНОЛОГИИ  
- PostgreSQL (в phpPgAdmin)  
- Excel (сводные таблицы и графики)  
- Tableau (интерактивные визуализации)  





ENG VERSION-----------------------------------------------------------------------------------------------------------------------
# VFM Data Analyst Portfolio Project

## DESCRIPTION  
This project was developed as an extension of the existing virtual football manager [vfm-estadio.ru](http://vfm-estadio.ru). The game simulates regular football matches using formulas and algorithms. Users manage their own teams and compete against each other. All match outcomes are based on player attributes and the underlying logic of the game formulas.  

The purpose of this project is to simplify in-game calculations and enhance understanding of relationships between player parameters through analytics and visualizations. It also serves as part of a portfolio for a Data Analyst role.



## PROJECT STRUCTURE  
- `/sql/create_tables/` — SQL scripts to create tables in phpPgAdmin  
- `/sql/sample_data/` — SQL scripts for generating random data  
- `/sql/analytics_queries/` — analytical SQL queries  
- `/db_structure/db_structure.sql/` — SQL script for generating the database schema  
- `/db_structure/db_structure.png/` — visualization of the database structure  
- `/db_structure/db_structure.dbml.txt/` — DBML script for database structure generation  
- `/excel_analysis/excel/` — pivot tables and visualizations in Excel  
- `/tableau_visual/tableau/` — reports and dashboards in Tableau  
- `README.md` — current project description  



## DATABASE  
Two main tables were created:  
1. `Users` — user information (id, email, tariff, activity, etc.)  
2. `Players` — player attributes, including:  
   - physical and psychological abilities (speed, strength, endurance, etc.)  
   - discipline and simulation tendency  
   - age, experience, and potential  
   - assigned field position  

Additionally, reference tables were created: `positions`, `specialisations`, `tariffs`, `user_types`, `working_legs`.



## SQL ANALYTICS  
Several business cases were implemented in the project:  
1. **Player potential compared to position average**  
   Comparing each player’s potential with the average for their position to identify overperformers.  
2. **Skill-position fit**  
   Calculating how well key attributes (speed, strength, endurance) match the assigned position.  
3. **Weak point detection**  
   Identifying underperforming skills compared to the average for the player’s position.  
4. **Discipline vs strength**  
   Detecting players who are physically strong but lack discipline.  
5. **Simulation tendency identification**  
   Finding players with a high tendency to simulate (diving), above the positional norm.  
6. **Finding substitutes**  
   Identifying players with similar key characteristics (speed, strength, endurance) as a given player.



## TECHNOLOGY STACK  
- PostgreSQL (via phpPgAdmin)  
- Excel (pivot tables and charts)  
- Tableau (interactive visualizations)
