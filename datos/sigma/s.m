#!/usr/bin/octave -qf
clear

x=[2,4,6,10,16,26,40,80,200]';
x=[x,zeros(9,1)];

for i=[1:9]
	data=load(sprintf("%01d.dat",x(i)));
	sumac=0;
	for j=[1:100]
		sumac+=data(j,2)^2;
	endfor
	x(i,2)=sqrt(sumac/99);
endfor
save 'odchylky.dat' x