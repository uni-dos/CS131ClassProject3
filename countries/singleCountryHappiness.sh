#!/bin/bash

FILE="$1".txt

gnuplot --persist << EOF

set datafile separator comma
set xlabel "Year"
set ylabel "Happiness"
set title "$1 Happiness"
set style fill pattern 2
set boxwidth 0.66
set xrange[2006:2023]
set yrange [0:10]
set xtics 1
set ytics .4
plot "$FILE" using 2:3 with boxes title "$1 Bar", "" using 2:3 with lines lc "black" lw 2 title "$1 Line"


EOF
