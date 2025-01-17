clc
clear all
close all


x=-0:0.1:1;
y=exp(-x)-x;
plot(x,y);


x=-3:0.1:2;
P=[1 1 -3 -3];
y=polyval(P,x);
plot(x,y);
grid on

x=-1:0.1:2;
P=[1 0 -2];
y=polyval(P,x);
plot(x,y);
grid on

x=-3:0.1:5;
y=exp(x)-3*x.*x;
plot(x,y);
grid on