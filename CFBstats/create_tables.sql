DROP TABLE IF EXISTS reception;

CREATE TABLE reception(
	game_code int,
	play_number int,
	team_code int,
	player_code int,
	reception int,
	yards int,
	touchdown boolean,
	first_down boolean,
	fumble boolean,
	fumble_lost boolean,
	safety boolean
);
DROP TABLE IF EXISTS pass;

CREATE TABLE pass(
	game_code int,
	play_number int,
	team_code int,
	passer_player_code int,
	receiver_player_code int,
	attempt boolean,
	completion boolean,
	yards int,
	touchdown boolean,
	interception boolean,
	first_down boolean,
	dropped boolean	
);
DROP TABLE IF EXISTS rush;
CREATE TABLE rush(
	game_code int,
	play_number int,
	team_code int,
	player_code int,
	attempt boolean,
	yards int,
	touchdown boolean,
	first_down boolean,
	sack boolean,
	fumble boolean,
	fumble_lost boolean,
	safety boolean
);

DROP TABLE IF EXISTS punt_return;
CREATE TABLE punt_return(
	game_code int,
	play_number int,
	team_code int,
	player_code int,
	attempt boolean,
	yards int,
	touchdown int,
	fumble_lost boolean,
	safety boolean,
	fair_catch int
);
DROP TABLE IF EXISTS punt;
CREATE TABLE punt(
	game_code int,
	play_number int,
	team_code int,
	player_code int,
	attempt boolean,
	yards int,
	blocked boolean,
	fair_catch boolean,
	touchback boolean,
	downed boolean,
	out_of_bounds boolean
);

DROP TABLE IF EXISTS play;
CREATE TABLE play(
	game_code int,
	play_number int,
	period_number int,
	clock int,
	offense_team_code int,
	defense_team_code int,
	offense_points int,
	defense_points int,
	down int,
	distance int,
	spot int,
	play_type VARCHAR(255),
	drive_number int,
	drive_play int
	
);
DROP TABLE IF EXISTS drive;
CREATE TABLE drive(
	game_code int,
	drive_number int,
	team_code int,
	start_period int,
	start_clock int,
	start_spot int,
	start_reason VARCHAR(255),
	end_period int,
	end_clock int,
	end_spot int,
	end_reason VARCHAR(255),
	plays int,
	yards int,
	time_of_possession int,
	red_zone_attempt boolean
);
DROP TABLE IF EXISTS player_game_statistics;
CREATE TABLE player_game_statistics(
	player_code int,
	game_code int,
	rush_attempt int,
	rush_yard int,
	rush_td int,
	pass_attempt int,
	pass_completion int,
	pass_td int,
	pass_int int,
	pass_conv int,
	receptions int,
	reception_yards int,
	reception_td int,
	kickoff_returns int,
	kickoff_return_yards int,
	kickoff_return_td int,
	punt_return int,
	punt_return_yards int,
	punt_return_td int,
	fumble_return int,
	fumble_return_yards int,
	fumble_return_td int,
	int_return int,
	int_return_yards int,
	int_return_td int,
	misc_return int,
	misc_return_yards int,
	misc_return_td int,
	field_goal_attempt int,
	field_goal_made int,
	off_XP_kick_attempt int,
	off_XP_kick_made int,
	off_2XP_attempt int,
	def_2XP_attempt int,
	def_2XP_made int,
	safey int,
	points int,
	punt int,
	punt_yards int,
	kickoff int,
	kickoff_yards int,
	kickoff_touchbacks int,
	kickoff_out_of_bounds int,
	kickoff_onside int,
	fumble int,
	fumble_lost int,
	tackle_solo int,
	tackle_assist int,
	tackle_for_loss int,
	tackle_for_loss_yards int,
	sack int,
	sack_yards int,
	qb_hurry int,
	fumble_forced int,
	pass_broken_up int,
	kick_punt_blocked int
);
DROP TABLE IF EXISTS team_game_statistics;
CREATE TABLE team_game_statistics(
	team_code int,
	game_code int,
	rush_att int,
	rush_yard int,
	rush_td int,
	pass_att int,
	pass_comp int,
	pass_yard int,
	pass_td int,
	pass_int int,
	pass_conv int,
	kickoff_ret int,
	kickoff_ret_yard int,
	kickoff_ret_td int,
	punt_ret int,
	punt_ret_yard int,
	punt_ret_td int,
	fum_ret int,
	fum_ret_yard int,
	fum_ret_td int,
	int_ret int,
	int_ret_yard int,
	int_ret_td int,
	misc_ret int,
	misc_ret_yard int,
	misc_ret_td int,
	field_goal_att int,
	field_goal_made int,
	off_xp_kick_att int,
	off_xp_kick_made int,
	off_2xp_att int,
	off_2xp_made int,
	def_2xp_att int,
	def_2xp_made int,
	safety int,
	points int,
	punt int,
	punt_yard int,
	kickoff int,
	kickoff_yard int,
	kickoff_touchback int,
	kickoff_out_of_bounds int,
	kickoff_onside int,
	fumble int,
	fumble_lost int,
	tackle_solo int,
	tackle_assist int,
	tackle_for_loss int,
	tackle_for_loss_yard int,
	sack int,
	sack_yard int,
	qb_hurry int,
	fumble_forced int,
	pass_broken_up int,
	kick_punt_blocked int,
	1st_down_rush int,
	1st_down_pass int,
	1st_down_penalty int,
	time_of_possession int,
	penalty int,
	penalty_yard int,
	third_down_att int,
	third_down_conv int,
	fourth_down_att int,
	fourth_down_conv int,
	red_zone_att int,
	red_zone_td int,
	red_zone_field_goal int
);
DROP TABLE IF EXISTS game_statistics;
CREATE TABLE game_statistics(
	game_code int,
	attendance int,
	duration int
);
DROP TABLE IF EXISTS player;
CREATE TABLE player(
	player_code int,
	team_code int,
	last_name VARCHAR(255),
	first_name VARCHAR(255),
	uniform_number int,
	class VARCHAR(255),
	position VARCHAR(255),
	height int,
	weight int,
	home_town VARCHAR(255),
	home_state VARCHAR(255),
	home_country VARCHAR(255),
	last_school VARCHAR(255)
);
DROP TABLE IF EXISTS game;
CREATE TABLE game(
	game_code int,
	game_date VARCHAR(255),
	visit_team_code int,
	home_team_code int,
	stadium_code int,
	site VARCHAR(255)
);
DROP TABLE IF EXISTS stadium;
CREATE TABLE stadium(
	stadium_code int,
	name VARCHAR(255),
	city VARCHAR(255),
	state VARCHAR(255),
	capacity int,
	surface VARCHAR(255),
	year_opened int
);
DROP TABLE IF EXISTS team;
CREATE TABLE team(
	team_code int,
	name VARCHAR(255),
	conference_code int
);
DROP TABLE IF EXISTS conference;
CREATE TABLE conference(
	conference_code int,
	name VARCHAR(255),
	subdivision VARCHAR(255)
);