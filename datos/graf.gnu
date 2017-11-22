#!/usr/bin/gnuplot

set terminal epslatex size 18cm,12cm
set title
set grid x,y

set terminal wxt

set samples 20000
unset logscale
set output 't1.tex'
set xlabel '$T_0$ (\si{\ms})'
set ylabel '$A$'
set yrange[0:0.05]
set xrange[4.5:1050]
set logscale x
set key bottom right


f(x)=A0*(1-exp(-x/T1))
fit f(x) 't1.txt' via A0, T1
plot 't1.txt' ps 3 lw 3 title 'naměřeno', f(x) lw 3 title '$\num{0.0425}(1-\exp(-x/\num{65.23}))$'
unset logscale



set output 'tau.tex'
set xlabel '$\tau$ (\si{\us})'
set ylabel '$A$'
set yrange[0:0.050]
set xrange[0:43]

set key top left

y=2*pi*42.512990
g(x)=A1*abs( sin( w*x)  )
A1=0.04
w=0.045*2*pi
fit g(x) 'tau.txt' via A1, w
plot 'tau.txt' ps 3 lw 3 t "naměřeno", g(x) lw 3 title '$\num{0.0408} |\sin(\num{0.287} \cdot x)|$'




set output 't2.tex'
set xlabel '$t_{12}$ (\si{\us})'
set ylabel '$A$'
set yrange[0.0006:0.07]
set xrange[90:7500]
set key top right


h(x)=A2*exp(-x/T2)
A2=0.07
T2=700
fit h(x) 't2.txt' via A2,T2
j(x)=-x/T22+C
fit j(x) 't2.txt' u 1:(log($2)) via T22,C


unset logscale
plot 't2.txt' ps 3 lw 3 t "naměřeno", h(x) lw 3 t '$\num{0.0665}\exp(-x/\num{957})$', exp(j(x))


set terminal wxt
set output