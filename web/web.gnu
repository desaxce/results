#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
set style line 1 lt 1 lc rgb "red" lw 5
set style line 2 lt 2 lc rgb "green" lw 5

#set terminal png enhanced size 900,600 truecolor font ',20'

set terminal eps
set termoption dashed
set output '$1.eps'
#set key left top

set grid

set xlabel 'Website'
set ylabel 'Page Load Time in seconds'

set xtics nomirror
set ytics 0,1
set yrange [0:*]

plot "$1" using 2 title 'HTTP/1.1' with lines ls 1, \
	 "$1" using 4 title 'HTTP/2' with lines ls 2, \
#load "loop_til_escape"

#plot "$1" using 3:xticlabels(1) title 'HTTP/1.1 S' with filledcurves x1 lt rgb red, \
#	 "$1" using 5:xticlabels(1) title 'HTTP/2 S' with filledcurves x1 lt rgb green
#load "loop_til_escape"
#unset multiplot

EOF
