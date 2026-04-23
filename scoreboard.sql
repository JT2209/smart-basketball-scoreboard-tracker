CREATE DATABASE IF NOT EXISTS smart_basketball_scoreboard_tracker
USE smart_basketball_scoreboard_tracker

CREATE TABLE "games" (
	"game_id"	INTEGER,
	"home_team_id"	INTEGER NOT NULL,
	"away_team_id"	INTEGER NOT NULL,
	"game_date"	TEXT,
	"period_length_minutes"	INTEGER DEFAULT 12,
	"current_period"	INTEGER DEFAULT 1,
	"home_score"	INTEGER DEFAULT 0,
	"away_score"	INTEGER DEFAULT 0,
	"home_fouls"	INTEGER DEFAULT 0,
	"away_fouls"	INTEGER DEFAULT 0,
	"home_timeouts"	INTEGER DEFAULT 5,
	"away_timeouts"	INTEGER DEFAULT 5,
	"clock_time_remaining"	INTEGER DEFAULT 720,
	"game_status"	TEXT DEFAULT 'not started',
	PRIMARY KEY("game_id" AUTOINCREMENT),
	FOREIGN KEY("away_team_id") REFERENCES "teams"("team_id"),
	FOREIGN KEY("home_team_id") REFERENCES "teams"("team_id")
);

CREATE TABLE "teams" (
	"team_id"	INTEGER,
	"team_name"	TEXT NOT NULL,
	PRIMARY KEY("team_id" AUTOINCREMENT)
);

CREATE TABLE "players" (
	"player_id"	INTEGER,
	"team_id"	INTEGER NOT NULL,
	"player_name"	TEXT NOT NULL,
	"jersey_number"	INTEGER,
	PRIMARY KEY("player_id" AUTOINCREMENT),
	FOREIGN KEY("team_id") REFERENCES "teams"("team_id")
);

CREATE TABLE "game_events" (
	"event_id"	INTEGER,
	"game_id"	INTEGER NOT NULL,
	"team_id"	INTEGER,
	"player_id"	INTEGER,
	"event_type"	TEXT NOT NULL,
	"event_value"	INTEGER,
	"event_time"	TEXT,
	"period_number"	INTEGER,
	PRIMARY KEY("event_id" AUTOINCREMENT),
	FOREIGN KEY("game_id") REFERENCES "games"("game_id"),
	FOREIGN KEY("player_id") REFERENCES "players"("player_id"),
	FOREIGN KEY("team_id") REFERENCES "teams"("team_id")
);
