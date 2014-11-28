#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
blue = "#0000FF"; purple = "#FF00FF"

set style fill transparent solid 0.5 border -1
set boxwidth 0.9 relative

#set terminal png enhanced size 900,600 truecolor font ',20'
#set output '$1.png'
set term postscript eps enhanced color font ',20'

set output "exp.ps"
set title 'Livebox (ping \~50ms)'
set grid

set xlabel 'Site Web'
set ylabel 'Temps de chargement (en s)'


set xtics rotate by 45 right nomirror
set ytics nomirror

set yrange [0:*]
set linestyle 1 lt 1 lw 2 lc 1
set linestyle 2 lt 1 lw 2 lc 2
set linestyle 3 lt 2 lw 2 lc 1
set linestyle 4 lt 2 lw 2 lc 2

plot "$1" using 3:xticlabels(1) title 'HTTP/1.1 S' with lines ls 1, \
	 "$1" using 2:xticlabels(1) title 'HTTP/1.1' with lines ls 2, \
	 "$1" using 5:xticlabels(1) title 'HTTP/2 S' with lines ls 3, \
	 "$1" using 4:xticlabels(1) title 'HTTP/2' with lines ls 4

EOF
