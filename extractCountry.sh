COUNTRY=$1
FILE=$2


grep "$COUNTRY" $FILE >> countries/"$COUNTRY".txt
