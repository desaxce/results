#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00";
yellow = "#FFFF00"; blue = "#0000FF";
other = "#00FFFF";
set style fill transparent solid 0.5 border -1
set boxwidth 0.9 relative

set terminal png enhanced size 900,600 truecolor font ',19'
set output '$1.png'

#set multiplot layout 1, 2

#set title 'Page loading times comparison: Wired'
set title 'Simulation de pertes de paquets'
set grid

set xlabel 'Site Web'
set ylabel 'Ratio HTTP/2 sur HTTP/1.1'

set xtics rotate by 45 right nomirror
set ytics nomirror

set yrange [0:1.6]

plot "$1" using (\$4/\$2):xticlabels(1) title '0%' with linespoints lt rgb red
#	 "$2" using (\$4/\$2):xticlabels(1) title '6%' with linespoints lt rgb green
#	 "$3" using (\$4/\$2):xticlabels(1) title '4%' with linespoints lt rgb yellow, \
#	 "$4" using (\$4/\$2):xticlabels(1) title '6%' with linespoints lt rgb blue, \
#	 "$5" using (\$4/\$2):xticlabels(1) title '6%' with linespoints lt rgb other

#load "loop_til_escape"

#unset multiplot

EOF
