close all;
clear all;

N=1000;
fp=500;
t=0:1/fp:(N-1)/fp;

x=sin(2*pi*150*t)+chirp(t,100,t(end),200)+randn(1,N);

figure; 
subplot(211);
plot(t,x);grid on;
title('sygnał');
xlabel('czas [s]');
ylabel('x(t)');

Nf=1024;
Nf21=Nf/2+1;
tf=linspace(0,fp/2,Nf21);
y=fft(x);
y_mod=abs(y);
subplot(212);
plot(tf,y_mod(1:Nf21));grid on;
title('transformata sygnału');
xlabel('czestotliwosc [Hz]');
ylabel('|X(t)|');