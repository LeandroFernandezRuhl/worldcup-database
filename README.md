# World Cup Database Project
This database stores data related to the FIFA World Cup. The data is stored in two tables: "games" and "teams". The "games" table contains information about each game played, such as the year, round, winner, opponent, and the number of goals scored by each team. The "teams" table contains information about each team that participated in the tournament, such as the team name and ID.

The scripts provided perform various SQL queries to extract information from the database. The first script, queries.sh, uses the psql command to execute SQL queries and retrieve results. The queries and their respective results are displayed on the console.

The second script, import_data.sh, populates the database with data from a CSV file called "games.csv". The script reads each line of the CSV file and inserts the data into the "games" and "teams" tables. If a team is not found in the "teams" table, it is inserted before the game data is inserted.

To use these scripts, ensure that you have PostgreSQL installed and that you have created a database called "worldcup". You can then run the import_data.sh script to populate the database with data from the "games.csv" file. Once the data is imported, you can run the queries.sh script to perform SQL queries and retrieve information from the database.
