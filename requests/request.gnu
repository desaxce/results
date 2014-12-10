#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
set style fill transparent solid 0.5 border -1
#set boxwidth 1 relative

set terminal png enhanced size 1024,600 truecolor font ',20'
set output '$1.png'
set key left top
#set multiplot layout 1, 2

#set title 'Image \~1Mo: delay=100ms; losses=0%'
set grid

set xrange [0:99]
set yrange [0:*]

# English labels
set ylabel 'Page Load Time (in seconds)'
set xlabel 'Number of requests'

# French labels
#set ylabel 'Temps de chargement (en s)'
#set xlabel 'Nombre de requêtes'

set ytics 0,1
#plot "$1" using 0:1 title 'HTTP/1.1' with filledcurves x1 lt rgb red, \
#	 "$1" using 0:3 title 'HTTP/2' with filledcurves x1 lt rgb green
#load "loop_til_escape"

plot "$1" using 0:2 title 'HTTP/1.1' with filledcurves x1 lt rgb red, \
	 "$1" using 0:4 title 'HTTP/2' with filledcurves x1 lt rgb green
#load "loop_til_escape"

#unset multiplot

EOF
