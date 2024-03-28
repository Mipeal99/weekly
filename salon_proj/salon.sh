#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "

echo -e "\nWelcome to our hair salon appointment system, how may we help you?\n"
#list the available services
SERVICES=$($PSQL "select service_id,name from services order by service_id")
#NUMBER_OF_SERVICES=$($PSQL "select count(service_id) from services")

MAIN(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
echo -e "Here are the services that we provide. Please type the number of the service that you would like or \"exit\" to exit.\n"
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
echo "$SERVICE_ID) $SERVICE_NAME" #format it nicely
done
#ask for a valid number
read SERVICE_ID_SELECTED

if  [[ ${SERVICE_ID_SELECTED,,} == "exit" ]] #exit just in case and to not create awkward loops
then
echo Thanks for stopping by.
elif [[ ! $SERVICE_ID_SELECTED =~ ^[0-4]+$ ]] #if the number is not valid reprint the services
then
MAIN "Please enter a valid number."
else
#take info
SERVICE_CHOSEN=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
#take out the extra space
SERVICE_CHOSEN_FORMAT=$(echo $SERVICE_CHOSEN | sed -E 's/ *$|^ *//g')
echo -e "Understood, a $SERVICE_CHOSEN_FORMAT. Please enter your phone number to make your appointment."
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
#if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get the name and insert it into the database
    echo -e "\nIt seems we haven't registered you yet. What's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
#get the time they want the thing
echo -e "\nWhat time do you want for your $SERVICE_CHOSEN_FORMAT?"
read SERVICE_TIME

#get the customer and name
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
CUSTOMER_NAME_FORMAT=$(echo $CUSTOMER_NAME | sed -E 's/ *$|^ *//g')
#insert the appointment into the database
APPOINTMENT_INSERT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
#output with the name without an extra space
echo -e "I have put you down for a $SERVICE_CHOSEN_FORMAT at $SERVICE_TIME, $CUSTOMER_NAME_FORMAT."
fi
}
MAIN
