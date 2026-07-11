import sqlite3
import pandas as pandas

conn = sqlite3.connect('cricket.db)
cursor = conn.cursor()

cursor.executescript("""
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Match;
DROP TABLE IF EXISTS Player_Match;
CREATE TABLE Team (
Team_Id INTEGER PRIMARY KEY,
Team_Name TEXT
);
CREATE TABLE Match (
Match_Id INTEGER PRIMARY KEY,
Season_Id INTEGER,
Match_Winner INTEGER,
Win_Margin INTEGER
);
CREATE TABLE Player_Match (
Match_Id INTEGER,
Player_Id INTEGER
);
INSERT INTO Team VALUES
(1,'Chennai Super Kings'),(2,'Delhi Capitals'),
(3,'Deccan Chargers'),(4,'Delhi Daredevils'),
(5,'Mumbai Indians'),(6,'Kolkata Knight Riders'),
(7,'Rajasthan Royals'),(8,'Kings XI Punjab');
INSERT INTO Match VALUES
(1,7,5,35),(2,7,5,22),(3,8,5,45),(4,8,5,8),
(5,8,1,67),(6,8,6,19),(7,9,5,33),(8,9,1,28),
(9,9,5,12),(10,9,6,55),(11,9,3,38),(12,9,7,4);
INSERT INTO Player_Match VALUES
(1,101),(1,102),(2,103),(3,101),(4,104),(5,102);
""")

conn.commit()
print('Database ready!')

tables = pd.read_sql("""SELECT *
FROM Match;""",conn)
print(matches)
print('Rows and Columns:',matches.shape)


teams = pd.read_sql("""SELECT *
FROM Team;""",conn)
print(teams)

team_names = pd.read_sql("""SELECT Match_Id,Player_Id
FROM Player_Match;""",conn)
print(player_matches)

# ---- PART 4: Filter Rows with WHERE ----
#WHERE keeps only the rows that match a condition -

rr_wins = pd.read_sql("""SELECT *
FROM MATCH
WHERE Match_Winner == 7;""",conn)
print(rr_wins)

mi_recent = pd.read_sql("""SELECT *
FROM MATCHWHERE Match_Winner == 5 AND Season_Id IN(8,9);""",conn)
print(mi_recent)

de_teams = pd.read_sql("""SELECT *
FROM TEMPORARYWHERE Team_Name LIKE 'De%';""",conn)
print(de_teams)

kings_teams = pd.read_sql("""SELECT *
FROM TEMPORARYWHERE Team_Name LIKE '%Kings';""",conn)
print(kings_teams)

win_margins = pd.read_sql("""SELECT MIN(Win_Margin),
MAX(Win_Margin)
    FROM Match;""",conn)
print(win_margins)

seasons = pd.read_sql("""SELECT MIN(Season_Id), MAX(Season_Id)
FROM Match;""",conn)
print(seasons)

conn.close()