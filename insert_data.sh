#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#year,round,winner,opponent,winner_goals,opponent_goals
echo $($PSQL "TRUNCATE teams,games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 if [[ $YEAR != year ]]
 then
  # get team_id for OPPONENT
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # if not found
  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    # insert team
    INSERT_RESULT_1=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')");
    echo $INSERT_RESULT_1
    # get new opponent_team_id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
 fi

  # get team_id for WINNER
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # if not found
  if [[ -z $WINNER_TEAM_ID ]]
  then
    # insert team
    INSERT_RESULT_2=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')");
    echo $INSERT_RESULT_2
    # get new winner_team_id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi
  # insert into games
  INSERT_RESULT_3=$($PSQL"INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  echo $INSERT_RESULT_3
 fi
done