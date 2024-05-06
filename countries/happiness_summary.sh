#!/usr/bin/env bash

file=$1
country=$2

# Check if file exists or not
if [ ! -f "$file" ]
then
	echo "File not found: $file"
	exit 1
fi

# Print the header
echo "Country,Avg Happiness,Avg GDP,Avg Life Expectancy,Avg Freedom"

#Initialize the variables
sum_happiness=0
sum_gdp=0
sum_life=0
sum_freedom=0

count=0

# Read file line by line
while IFS=, read -r line_country year happiness gdp social_support life_expectancy freedom generosity corruption
do
	# Calculate sum of happiness, gdp and life expectancy columns
	if [ "$line_country" == "$country" ]
	then
		sum_happiness=$(echo "$sum_happiness + $happiness" | bc -l)
		sum_gdp=$(echo "$sum_gdp + $gdp" | bc -l)
		sum_life=$(echo "$sum_life + $life_expectancy" | bc -l)
		sum_freedom=$(echo "$sum_freedom + $freedom" | bc -l)
	
		count=$((count + 1))
	fi
done < "$file"

# Calculate the mean average
mean_happiness=$(echo "scale=2; $sum_happiness / $count" | bc)
mean_gdp=$(echo "scale=2; $sum_gdp / $count" | bc)
mean_life=$(echo "scale=2; $sum_life / $count" | bc)
mean_freedom=$(echo "scale=2; $sum_freedom / $count" | bc)

# Print results
echo "$country,$mean_happiness,$mean_gdp,$mean_life,$mean_freedom"
	
exit 0

