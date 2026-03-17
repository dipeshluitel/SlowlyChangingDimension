CREATE TABLE players_scd(
	player_name TEXT,
	scoring_class scoring_class,
	is_active BOOLEAN,
	current_season INTEGER,
	start_season INTEGER,
	end_season INTEGER,
	player_streak INTEGER,
	PRIMARY KEY(player_name,start_season)
)


