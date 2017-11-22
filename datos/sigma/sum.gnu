#!/usr/bin/gnuplot


set terminal epslatex size 18cm,14cm
set output 'sum.tex'



set samples 20000

set title
set xlabel 'frekvence (\si{\kHz})'
set ylabel ''
set grid x,y
set yrange[0:0.0065]
set xrange[-80:80]
set key top left
set xtics 10
set ytic 0.0015
set format y ""

plot '200.dat' u 1:($2+0.0045) lw 3 t '200' w lines, '26.dat' u 1:($2+0.0030) lw 3 t '26' w lines, '6.dat' u 1:($2+0.0015) lw 3 t '6' w lines, '2.dat' lw 3 t "2" w lines



set terminal wxt
set output