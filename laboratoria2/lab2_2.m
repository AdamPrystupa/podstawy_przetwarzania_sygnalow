clear all;
close all;

 
fp=1000; % czesotliwosc probkowania
N=200;  % ilosc probek
t=0:1/fp:(N-1)/fp;
x=6*sin(2*pi*250*t)+3*sin(2*pi*350*t)+2*randn(1,N);

subplot(2,1,1);
grid on;

plot(t,x,'b');
title('sygnal');
xlabel('czas [s]');
ylabel('x(t)');

Nf=1024;%%%%%%%%% rzad transformaty  
% Nf - potega liczby 2!!!
% Nf > N
% Nf >= fp 
% Nf - minimalna potega liczby 2 >= N, >=fp 
Nf21=Nf/2+1;
v=fft(x,Nf);  %transformata fouriera
w=abs(v);
f=linspace(0,fp/2,Nf21); %generowanie osi częstotliwości (początek, koniec, ilośc punktów)
subplot(2,1,2);
plot(f,w(1:Nf21));
title('transformata sygnalu');
xlabel('czestotliwosc [Hz]');
ylabel('|X(f)|');

%%%%%%%%%%%%%%%%%%%%%%%%%%

