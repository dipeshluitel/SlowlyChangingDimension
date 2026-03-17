-- INSERTING INTO players_scd

INSERT INTO players_scd
WITH with_previous AS(

SELECT 
	player_name,
	current_season,
	scoring_class,
	is_active, 
	LAG(scoring_class,1) OVER (PARTITION BY player_name ORDER BY current_season ) AS previous_scoring_class,
	LAG(is_active,1) OVER (PARTITION BY player_name ORDER BY current_season ) AS previous_active_class
FROM players
WHERE current_season <= 2021

),

with_indicators AS(

SELECT *,
	CASE 
	WHEN scoring_class <> previous_scoring_class THEN 1 
	WHEN is_active <> previous_active_class THEN 1 
		ELSE 0
	END AS change_indicator
FROM with_previous

),

with_streak AS(
SELECT *,
	SUM(change_indicator) 
	OVER (PARTITION BY player_name ORDER BY current_season ) AS player_streak 
FROM with_indicators
)

SELECT player_name,
	   scoring_class,
	   is_active,
	   2021 AS current_season,
	   MIN(current_season) as start_season,
	   MAX(current_season) as end_season,
	   player_streak
FROM with_streak GROUP BY player_name, player_streak, is_active, scoring_class ORDER BY player_name
