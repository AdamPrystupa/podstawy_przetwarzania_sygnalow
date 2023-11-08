close all;
clear all;



N = 2000;
fp = 1000;
t = 0:1/fp:(N-1)/fp;

x = 5*chirp(t,200,4,300) + sin(2*pi*150*t)+sin(2*pi*250*t);

figure; 

subplot(3, 2, 1);
plot(t, x);
title('Sygnał');
xlabel('Czas [s]');
ylabel('x(t)');

Nf=2048;
Nf21=Nf/2+1;
tx=linspace(0,fp/2,Nf21);
xf=fft(x);
xf_mod=abs(xf);
subplot(322);
plot(tx,xf_mod(1:Nf21));
title('transformata sygnału org.');
xlabel('czestotliwosc [Hz]');
ylabel('modul widma');

M=201;
y=fir1(M-1,.463);
ty=0:1/fp:(M-1)/fp;
subplot(323);
plot(ty,y);
title('odpowiedz impulsowa');
xlabel('czas [s]');
ylabel('amplituda');

Nfy=1024;
Nf21y=Nfy/2+1;
tyf=linspace(0,fp/2,Nf21y);
yf=fft(y,Nfy);
yf_mod=abs(yf);
subplot(324);
plot(tyf,yf_mod(1:Nf21y));
title('transformata opd. imp.');
xlabel('czestotliwosc [Hz]');
ylabel('modul widma');


z=filter(y,1,x);
subplot(325);
plot(t,z);
title('sygnal po filtracji');
xlabel('czas [s]');
ylabel('amplituda');


zf=fft(z,Nf);
zf_mod=abs(zf);
subplot(326);
plot(tx,zf_mod(1:Nf21));
title('transformata syg. po filtracji');
xlabel('czestotliwosc [Hz]');
ylabel('modul widma');









