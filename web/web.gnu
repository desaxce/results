#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"

set style fill transparent solid 0.5 border -1
set boxwidth 0.9 relative

set terminal png enhanced size 900,600 truecolor font ',20'
set output '$1.png'

#set multiplot layout 1, 2

#set title '3G (ping \~380ms) - Ratio: 0.803'
set grid

#set xlabel 'Site Web'
#set ylabel 'Temps de chargement (en s)'

set xlabel 'Website'
set ylabel 'Page Load Time (in seconds)'

set xtics rotate by 45 right nomirror
set ytics nomirror 0,5

set yrange [0:*]

plot "$1" using 2:xticlabels(1) title 'HTTP/1.1' with filledcurves x1 lt rgb red, \
	 "$1" using 4:xticlabels(1) title 'HTTP/2' with filledcurves x1 lt rgb green
load "loop_til_escape"

#plot "$1" using 3:xticlabels(1) title 'HTTP/1.1 S' with filledcurves x1 lt rgb red, \
#	 "$1" using 5:xticlabels(1) title 'HTTP/2 S' with filledcurves x1 lt rgb green
#load "loop_til_escape"
#unset multiplot

EOF
