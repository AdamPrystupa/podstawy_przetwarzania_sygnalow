clear all;
close all;


N=1000;
fp=1000;
t= 0:1/fp : (N-1)/fp;

x1 = sin(2*pi*100*t) + sin(2*pi*15*t);
x=sin(2*pi*100*t)+ 20*randn(1,N);% 1 wiersz N kolumn zwraca
subplot(2,1,1);
plot(t,x);
title('sygnal');
xlabel('czas [s]');
ylabel( 'x(t)');

kmax = 100;  %im większy tym większy odcinek czasu bieżemy ; dobieramy tak żeby było widać 2-3 maksima
rx = xcorr(x,x,kmax);
tx = -kmax/fp : 1/fp : kmax/fp;
subplot(2,2,3);
plot(tx,rx);
title('autokorelacja x');
xlabel('opoznienie [s]');
ylabel( 'xcorr');


kmax1 = 100;
rx = xcorr(x,x1,kmax1);
tx = -kmax1/fp : 1/fp : kmax1/fp;
subplot(2,2,4);
plot(tx,rx);
title('korelacja x i x1');
xlabel('opoznienie [s]');
ylabel( 'xcorr');
