#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"

set style fill transparent solid 0.5 border -1
set boxwidth 0.9 relative

set terminal png enhanced size 1600,600
set output 'web.png'

set multiplot layout 1, 2

set title 'Page loading times comparison: Yiping - delay=100ms'
set grid

set xlabel 'Webpage requested'
set ylabel 'Page Loading Time (PLT) in seconds'

set xtics rotate by 45 right nomirror
set ytics nomirror

set yrange [0:*]

plot "web_output.txt" using 2:xticlabels(1) title 'HTTP/1.1' with boxes lt rgb red, \
	 "web_output.txt" using 4:xticlabels(1) title 'HTTP/2' with boxes lt rgb green
#load "loop_til_escape"

plot "web_output.txt" using 3:xticlabels(1) title 'HTTP/1.1 secure' with boxes lt rgb red, \
	 "web_output.txt" using 5:xticlabels(1) title 'HTTP/2 secure' with boxes lt rgb green
#load "loop_til_escape"
unset multiplot

EOF
