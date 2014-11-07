#!/bin/sh
gnuplot << EOF

set style fill transparent solid 0.5 border -1
set boxwidth 1 relative
# set yrange [0:*]
set ylabel 'PLT (s)'
set xlabel 'Webpage requested'
set xtics rotate by 45 right nomirror
set ytics nomirror
set title 'Page loading times comparison: Yiping - delay=100ms"
set grid

plot "web_output.txt" using 4:xticlabels(1) title 'HTTP/1.1' with boxes, \
	 "web_output.txt" using 2:xticlabels(1) title 'HTTP/2' with boxes
load "loop_til_escape"

plot "web_output.txt" using 5:xticlabels(1) title 'HTTP/1.1 secure' with boxes, \
	 "web_output.txt" using 3:xticlabels(1) title 'HTTP/2 secure' with boxes
load "loop_til_escape"

EOF
