nba2-- Creating database
CREATE DATABASE `nba2`;

-- Creating table
CREATE TABLE `nba2`.`players_average` (
	`data_index` VARCHAR(10) NOT NULL,
	`season` VARCHAR(10) NOT NULL,
	`player_id` VARCHAR(10) NOT NULL,
	`player` VARCHAR(30) NOT NULL,
	`birth_year` VARCHAR(10) NOT NULL,
	`pos` VARCHAR(10) NOT NULL,
	`age` INT NOT NULL,
	`experience` INT NOT NULL,
	`lg` VARCHAR(10) NOT NULL,
	`tm` VARCHAR(10) NOT NULL,
	`g` INT NOT NULL,
	`gs` INT(10) NULL,
	`mpg` FLOAT NULL,
	`fgpg` FLOAT NULL,
	`fgapg` FLOAT NULL,
	`fg_percent` FLOAT NULL,
	`3pmpg` FLOAT NULL,
	`3papg` FLOAT NULL,
	`3p_percent` FLOAT NULL,
	`2pmpg` FLOAT NULL,
	`2papg` FLOAT NULL,
	`2p_percent` FLOAT NULL,
	`efg_percent` FLOAT NULL,
	`ftpg` FLOAT NULL,
	`ftapg` FLOAT NULL,
	`ft_percent` FLOAT NULL,
	`orbpg` FLOAT NULL,
	`drbpg` FLOAT NULL,
	`trbpg` FLOAT NULL,
	`astpg` FLOAT NULL,
	`stlpg` FLOAT NULL,
	`blkpg` FLOAT NULL,
	`tovpg` FLOAT NULL,
	`pfpg` FLOAT NULL,
	`ptspg` FLOAT NULL
)
;

CREATE TABLE `nba2`.`players_total` (
	`data_index` VARCHAR(10) NOT NULL,
	`season` VARCHAR(10) NOT NULL,
	`player_id` VARCHAR(10) NOT NULL,
	`player` VARCHAR(30) NOT NULL,
	`birth_year` VARCHAR(10) NOT NULL,
	`pos` VARCHAR(10) NOT NULL,
	`age` INT NOT NULL,
	`experience` INT NOT NULL,
	`lg` VARCHAR(10) NOT NULL,
	`tm` VARCHAR(10) NOT NULL,
	`g` INT NOT NULL,
	`gs` INT NULL,
	`tmp` FLOAT NULL,
	`tfgm` FLOAT NULL,
	`tfga` FLOAT NULL,
	`fg_percent` FLOAT NULL,
	`t3pm` FLOAT NULL,
	`t3pa` FLOAT NULL,
	`t3p_percent` FLOAT NULL,
	`t2p` FLOAT NULL,
	`t2pa` FLOAT NULL,
	`2p_percent` FLOAT NULL,
	`efg_percent` FLOAT NULL,
	`tft` FLOAT NULL,
	`tfta` FLOAT NULL,
	`ft_percent` FLOAT NULL,
	`torb` FLOAT NULL,
	`tdrb` FLOAT NULL,
	`ttrb` FLOAT NULL,
	`tast` FLOAT NULL,
	`tstl` FLOAT NULL,
	`tblk` FLOAT NULL,
	`ttov` FLOAT NULL,
	`tpf` FLOAT NULL,
	`tpts` FLOAT NULL
)
;

CREATE TABLE `nba2`.`team` (
	`team_name` VARCHAR(30) PRIMARY KEY NOT NULL,
	`tm` VARCHAR(10) NOT NULL
)
;

CREATE TABLE `nba2`.`player` (
	`player_id` VARCHAR(10) PRIMARY KEY NOT NULL,
	`player` VARCHAR(30) NOT NULL
)
;

-- Let's see the data
SELECT * FROM players_average;

-- 2023-24 NBA Season
-- Let's see those who played in 2023-24 NBA Season
SELECT * FROM players_average WHERE season = 2024;

-- How many teams participated in 2023-24 NBA Season?
SELECT COUNT(DISTINCT tm) AS number_of_teams FROM players_average WHERE season = 2024 AND tm <> "TOT";
-- How many players participated in 2023-24 NBA Season?
SELECT COUNT(DISTINCT player) AS number_of_players FROM players_average WHERE season = 2024; 
-- How many players have been traded during the season?
SELECT COUNT(DISTINCT player) AS number_of_trade_transaction FROM players_average WHERE season = 2024 AND tm = "TOT";

-- Distribution of players though their position
SELECT pos AS POS, COUNT(DISTINCT player) AS number_of_players_at_each_pos FROM players_average WHERE season = 2024 GROUP BY pos ORDER BY 2 DESC;

-- Who is leading in each stats?
SELECT player, tm, ptspg FROM players_average WHERE season = 2024 AND tm <> "TOT" AND g >= 65 ORDER BY ptspg DESC;
SELECT player, tm, astpg FROM players_average WHERE season = 2024 AND tm <> "TOT" AND g >= 65 ORDER BY astpg DESC;
SELECT player, tm, trbpg FROM players_average WHERE season = 2024 AND tm <> "TOT" AND g >= 65 ORDER BY trbpg DESC;
SELECT player, tm, stlpg FROM players_average WHERE season = 2024 AND tm <> "TOT" AND g >= 65 ORDER BY stlpg DESC;
SELECT player, tm, blkpg FROM players_average WHERE season = 2024 AND tm <> "TOT" AND g >= 65 ORDER BY blkpg DESC;