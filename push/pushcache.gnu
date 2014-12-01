#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
blue = "#0000FF"; purple = "#FF00FF"

set style fill transparent solid 0.5 border -1
set boxwidth 0.9 relative

set terminal png enhanced size 900,600 truecolor font ',20'
set output 'output.png'

set title '20 tests effectués'
set grid

set format x ""
set ylabel 'Temps de chargement (en s)'


set xtics nomirror
set ytics nomirror 0.6,0.1

#set yrange [0:*]

plot "nopushcache.txt" using 0:1 title 'Sans' with lines lt rgb red, \
	 "pushcache.txt" using 0:1 title 'Avec' with lines lt rgb green

EOF
