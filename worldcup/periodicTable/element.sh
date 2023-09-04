#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  else
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      # echo "$1 is a number"
      FETCH_FROM_ELEMENTS=$($PSQL "SELECT elements.atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number  INNER JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1 or name='$1'or symbol='$1'")
      else
      FETCH_FROM_ELEMENTS=$($PSQL "SELECT elements.atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number  INNER JOIN types ON properties.type_id=types.type_id WHERE name='$1'or symbol='$1'")
    fi
    if [[ -z $FETCH_FROM_ELEMENTS ]]
    then
      echo "I could not find that element in the database."
      else
        echo "$FETCH_FROM_ELEMENTS" | while IFS="|" read ATM_NUM SYM NAME ATOMIC_MASS  MELT_POINT  BOIL_POINT  TYPE
        do
          echo "The element with atomic number $ATM_NUM is $NAME ($SYM). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
        done
    fi
fi



#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  else
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      # echo "$1 is a number"
      FETCH_FROM_ELEMENTS=$($PSQL "SELECT elements.atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number  INNER JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1 or name='$1'or symbol='$1'")
      else
      FETCH_FROM_ELEMENTS=$($PSQL "SELECT elements.atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number  INNER JOIN types ON properties.type_id=types.type_id WHERE name='$1'or symbol='$1'")
    fi
    if [[ -z $FETCH_FROM_ELEMENTS ]]
    then
      echo "I could not find that element in the database."
      else
        echo "$FETCH_FROM_ELEMENTS" | while IFS="|" read ATM_NUM SYM NAME ATOMIC_MASS  MELT_POINT  BOIL_POINT  TYPE
        do
          echo "The element with atomic number $ATM_NUM is $NAME ($SYM). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
        done
    fi
fi



