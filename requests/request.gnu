#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
set style fill transparent solid 0.5 border -1
set style line 1 linecolor rgb "#FF0000" linetype 1 linewidth 5
set style line 2 linecolor rgb "#00FF00" linetype 3 linewidth 5
#set boxwidth 1 relative

#set terminal png enhanced size 1024,450 truecolor font ',22'
set term postscript eps enhanced
set output '$1.eps'
set key left top
#set multiplot layout 1, 2

#set title 'Image \~1Mo: delay=100ms; losses=0%'
set grid

set xrange [0:99]
set yrange [0:*]

# English labels
set ylabel 'Page Load Time in seconds'
set xlabel 'Number of requests'

# French labels
#set ylabel 'Temps de chargement (en s)'
#set xlabel 'Nombre de requêtes'

set ytics 0,1
set xtics nomirror
#plot "$1" using 0:1 title 'HTTP/1.1' with filledcurves x1 lt rgb red, \
#	 "$1" using 0:3 title 'HTTP/2' with filledcurves x1 lt rgb green
#load "loop_til_escape"

plot "$1" using 0:2 title 'HTTP/1.1'with lines ls 1, \
	 "$1" using 0:4 title 'HTTP/2' with lines ls 2
#load "loop_til_escape"

#unset multiplot

EOF
