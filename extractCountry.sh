country=$1
file=$2

fileoutput=$(sed "s/ /./g" <<< $country)

grep "$country" $file >> countries/"$fileoutput".txt
