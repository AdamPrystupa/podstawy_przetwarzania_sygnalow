close all;
clear all;

N=2000;
fp=1000;
t=0:1/fp:(N-1)/fp;
x=sin(2*pi*150*t)+sin(2*pi*250*t)+sin(2*pi*100*t);

figure;
subplot(211);
plot(t,x); grid on;
title('sygnal oryginalny');
xlabel('czas [s]');
ylabel('x(t)');


kmax=50;
xx=xcorr(x,x,kmax);
tx=-kmax/fp:1/fp:kmax/fp;
subplot(212);
plot(tx,xx); grid on;
title('autokorelacja sygnalu oryginalnego');
xlabel('opoznienie [s]');
ylabel('xcorr');
