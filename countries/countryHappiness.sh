#!/bin/bash


echo "$#"
echo "$@"

gnuplot --persist << EOF

list = "$@"

set datafile separator comma
set xlabel "Year"
set ylabel "Happiness"
set title "Countries Happiness"
set style fill pattern 2
set boxwidth 0.66
set xrange[2006:2023]
set yrange [0:10]
set xtics 2
set ytics .4
set key outside
plot for [i in list] i using 2:3 with lines title i


EOF
