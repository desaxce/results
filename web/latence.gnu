#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00";
yellow = "#FFFF00"; blue = "#0000FF";
other = "#00FFFF";

set terminal eps
set termoption dashed
set output '$1.eps'
set key below

set grid

set xlabel 'Website'
set ylabel 'HTTP/2 over HTTP/1.1 ratio'

set xtics nomirror

set yrange [0:*]

plot "$1" using (\$4/\$2) title '0ms' with linespoints lt rgb red lw 5, \
	 "$2" using (\$4/\$2) title '50ms' with linespoints lt rgb green lw 5, \
	 "$3" using (\$4/\$2) title '100ms' with linespoints lt rgb yellow lw 5, \
	 "$4" using (\$4/\$2) title '150ms' with linespoints lt rgb blue lw 5, \
	 "$5" using (\$4/\$2) title '200ms' with linespoints lt rgb other lw 5

load "loop_til_escape"

#unset multiplot

EOF
