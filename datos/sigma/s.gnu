#!/usr/bin/gnuplot

set terminal epslatex size 16cm,10cm
set title
set grid x,y

set samples 20000

set output 's.tex'
set xlabel '$1/\sqrt{N}$'
set ylabel '$\sigma^2_{\bar{u^n}}$ ($\cdot 10^{-4}$)'
set yrange[0:0.0006]
unset logscale
set key top left
set xrange[0:210]




f(x)=A/sqrt(x)
fit f(x) 'odchylky.dat' via A


set xrange[0:0.8]

plot 'odchylky.dat' u (1/sqrt($1)):2  ps 3 lw 3 title 'naměřeno', A*x lw 3 title '$\num{0.000691}/\sqrt{N}$'



set terminal wxt
set output