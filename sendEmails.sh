#!/bin/bash
while read -r line;
do
IFS=', ' read -r -a player <<< "$line";
if test -f "./game/${player[0]}"; then
    echo "Sending email for player ${player[0]} to ${player[1]}";
    cat ./game/${player[0]}  ./game/start |  mail -s "${player[0]} assigned role in Avalon" ${player[1]}
    #mail -s "${player[0]} assigned role in Avalon" ${player[1]} < ./game/${player[0]} < ./game/start ;
    rm -f ./game/${player[0]}.sent 2> /dev/null
    mv ./game/${player[0]} ./game/${player[0]}.sent
fi
done < $1
