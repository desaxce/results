#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00";
yellow = "#FFFF00"; blue = "#0000FF";
other = "#00FFFF";

set terminal eps
set termoption dashed
set output '$1.eps'

set grid

set xlabel 'Website'
set ylabel 'HTTP/2 over HTTP/1.1 ratio'

set ytics nomirror
set yrange [0:*]

plot "$1" using (\$4/\$2) title '0%' with linespoints lt rgb red lw 5, \
	 "$2" using (\$4/\$2) title '6%' with linespoints lt rgb blue lw 5

#load "loop_til_escape"

#unset multiplot

EOF
