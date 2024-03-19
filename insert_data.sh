#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate table teams,games") #clear the tables
cat games.csv | while IFS=',' read YEAR ROUND WIN OPP WIN_GOALS OPP_GOALS #read each thing in the csv
do
if [[ $YEAR != 'year' ]] #if not the label
then
#get the team id for the winner
WIN_ID=$($PSQL "select team_id from teams where name='$WIN'")

if [[ -z $WIN_ID ]]
then
#if not present we add
WIN_INSERT=$($PSQL "insert into teams(name) values('$WIN')")
#sanity check
if [[ $WIN_INSERT == "INSERT 0 1" ]]
then
echo Inserted $WIN into teams
fi
#get the new id
WIN_ID=$($PSQL "select team_id from teams where name='$WIN'")
fi
#get the team for the opponent, if not present on teams we add
OPP_ID=$($PSQL "select team_id from teams where name='$OPP'")
if [[ -z $OPP_ID ]]
then
#if not present we add
OPP_INSERT=$($PSQL "insert into teams(name) values('$OPP')")
#sanity check
if [[ $OPP_INSERT == "INSERT 0 1" ]]
then
echo Inserted $OPP into teams
fi
#get the new id
OPP_ID=$($PSQL "select team_id from teams where name='$OPP'")
fi

#now we enter the rest on the games table
GAME_RES=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WIN_ID,$OPP_ID,$WIN_GOALS,$OPP_GOALS)")
if [[ $OPP_INSERT == "INSERT 0 1" ]]
then
echo Inserted $YEAR $ROUND $WIN VS $OPP into games
fi

fi #this is for the if not the comment row
done