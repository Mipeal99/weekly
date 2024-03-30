#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"
if [[ -z $1 ]] #check if the argument is empty
then
echo Please provide an element as an argument.
elif [[ $1 =~ ^[0-9]+$ ]] #check if it is a number
then
#check if there's an atomic number in the DB
ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1")
# if empty
if [[ -z $ATOMIC_NUMBER ]]
then #send it off
echo I could not find that element in the database.
else
#get the properties that remain, not the cleanest but works
TYPE=$($PSQL "select type from elements full join properties using(atomic_number) full join types using(type_id) where atomic_number=$ATOMIC_NUMBER")
NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUMBER")
SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUMBER")
MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
MELT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
BOIL=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
#print the thing
echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
fi

else #add another case for non numbers,

#check if the argument matches any of the symbols
SYMBOL=$($PSQL "select symbol from elements where UPPER(symbol)=UPPER('$1')")

if [[ -z $SYMBOL ]] #if it was not a symbol
then
#maybe it was a name so check if the argument matches any of the names
NAME=$($PSQL "select name from elements where UPPER(name)=UPPER('$1')")
if [[ -z $NAME ]] #if it was not a name then it's not in the database
then
echo I could not find that element in the database.
else #if it is a name
#get the rest of the properties
ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name='$NAME'")
TYPE=$($PSQL "select type from elements full join properties using(atomic_number) full join types using(type_id) where atomic_number=$ATOMIC_NUMBER")
SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUMBER")
MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
MELT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
BOIL=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
#print the thing
echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
fi

else #if we do have a symbol
ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$SYMBOL'")
#get the rest of the properties
TYPE=$($PSQL "select type from elements full join properties using(atomic_number) full join types using(type_id) where atomic_number=$ATOMIC_NUMBER")
NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUMBER")
MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
MELT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
BOIL=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
#print the thing
echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
fi
fi
