#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=game -t --no-align -c"
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "select user_id from users where name ilike '$USERNAME'")
if [[ -z $USER_ID ]]
then
#if the username doesn't exist we create it and get the user id again to use later
echo -e "Welcome, $USERNAME! It looks like this is your first time here."
USER_INSERT=$($PSQL "insert into users(name) values('$USERNAME')")
USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
else
#if not we do the welcome back and get the stats
USER_ID=$($PSQL "select user_id from users where name ilike '$USERNAME'")
USERNAME=$($PSQL "select name from users where user_id=$USER_ID")
GAMES_PLAYED=$($PSQL "select count(game_id) from games where user_id=$USER_ID")
BEST_GAME=$($PSQL "select min(guesses) from games where user_id=$USER_ID")
echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
#start of the game
echo -e "\nGuess the secret number between 1 and 1000:"
SECRET=$((1 + $RANDOM % 1000))  
COUNTER=0
GUESS=-1
while [[ $GUESS != $SECRET ]]
do
read GUESS
if [[ ! $GUESS =~ ^[0-9]+$ ]]
#if the guess is not a number
then
echo "That is not an integer, guess again:"
elif [[ $GUESS < $SECRET ]]
then
echo "It's higher than that, guess again:"
COUNTER=$((COUNTER + 1)) 

elif [[ $GUESS > $SECRET ]]
then
echo "It's lower than that, guess again:"
COUNTER=$((COUNTER + 1)) 

else
COUNTER=$((COUNTER + 1))
GAME_INSERT=$($PSQL "insert into games(guesses,user_id) values($COUNTER,$USER_ID)")
echo -e "You guessed it in $COUNTER tries. The secret number was $SECRET. Nice job!"
break
fi
done
