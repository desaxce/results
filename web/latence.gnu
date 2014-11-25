#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
yellow = "#FFFF00"; blue = "#0000FF";
other = "#00FFFF";
set style fill transparent solid 0.5 border -1
set boxwidth 0.9 relative

set terminal png enhanced size 900,600 truecolor font ',19'
set output '$1.png'

#set multiplot layout 1, 2

#set title 'Page loading times comparison: Wired'
set title 'Filaire - Yiping'
set grid

set xlabel 'Site Web'
set ylabel 'Temps de chargement (en s)'

set xtics rotate by 45 right nomirror
set ytics nomirror

set yrange [0:*]

plot "$1" using (\$4/\$2):xticlabels(1) title '0ms' with lines lt rgb red, \
	 "$2" using (\$4/\$2):xticlabels(1) title '50ms' with lines lt rgb green, \
	 "$3" using (\$4/\$2):xticlabels(1) title '100ms' with lines lt rgb yellow, \
	 "$4" using (\$4/\$2):xticlabels(1) title '150ms' with lines lt rgb blue, \
	 "$5" using (\$4/\$2):xticlabels(1) title '200ms' with lines lt rgb other

load "loop_til_escape"

#unset multiplot

EOF
