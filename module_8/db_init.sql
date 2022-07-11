DROP USER IF EXISTS 'pysports_user'@'localhost';

CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'P00p$@ndw1ch';
 
GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost';


DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;


CREATE TABLE team (
    team_id     INT             NOT NULL        AUTO_INCREMENT,
    team_name   VARCHAR(75)     NOT NULL,
    mascot      VARCHAR(75)     NOT NULL,
    PRIMARY KEY(team_id)
); 

CREATE TABLE player (
    player_id   INT             NOT NULL        AUTO_INCREMENT,
    first_name  VARCHAR(75)     NOT NULL,
    last_name   VARCHAR(75)     NOT NULL,
    team_id     INT             NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team 
    FOREIGN KEY(team_id)
        REFERENCES team(team_id)
);

INSERT INTO team(team_name, mascot)
    VALUES('Team Brown Coats', 'Rebels');
INSERT INTO team(team_name, mascot)
    VALUES('Team Purple-Belly', 'Alliance Soldier');
 
INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Malcom', 'Reynolds', (SELECT team_id FROM team WHERE team_name = 'Team Brown Coats'));
INSERT INTO player(first_name, last_name, team_id)
    VALUES('Zoe', 'Washburn', (SELECT team_id FROM team WHERE team_name = 'Team Brown Coats'));
INSERT INTO player(first_name, last_name, team_id)
    VALUES('Kaylee', 'Frye', (SELECT team_id FROM team WHERE team_name = 'Team Brown Coats'));
INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Commander', 'Harken', (SELECT team_id FROM team WHERE team_name = 'Team Purple-Belly'));
INSERT INTO player(first_name, last_name, team_id)
    VALUES('Magistrate', 'Higgins', (SELECT team_id FROM team WHERE team_name = 'Team Purple-Belly'));
INSERT INTO player(first_name, last_name, team_id)
    VALUES('Jeff', 'Ricketts', (SELECT team_id FROM team WHERE team_name = 'Team Purple-Belly'));
