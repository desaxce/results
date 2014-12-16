#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
set style line 1 lt 1 lc rgb "red" lw 5
set style line 2 lt 2 lc rgb "green" lw 5

#set terminal eps enhanced size 1024,600 truecolor font ',24'
set terminal eps enhanced
set termoption dashed
set output '$1.eps'
set key left top

set grid

set xrange [0:99]
set yrange [0:*]

# English labels
set ylabel 'Page Load Time in seconds'
set xlabel 'Number of requests'

set ytics 0,1
set xtics nomirror

plot "$1" using 0:2 title 'HTTP/1.1' with lines ls 1, \
	 "$1" using 0:4 title 'HTTP/2' with lines ls 2 
#load "loop_til_escape"

#plot "$1" using 0:1 title 'HTTP/1.1' with filledcurves x1 lt rgb red, \
#	 "$1" using 0:3 title 'HTTP/2' with filledcurves x1 lt rgb green
#load "loop_til_escape"

#unset multiplot

EOF
