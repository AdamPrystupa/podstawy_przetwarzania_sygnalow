clear all;

N= 4000;
fp = 1000;
t = 0:1/fp :(N-1)/fp;

x = 6*chirp(t,100,4,400) + 3*randn(1,N);
subplot(3,2,1);
plot(t,x);
title('sygnal org');
xlabel('czas [s]');
ylabel('x(t)');





Nf = 2^12;
Nf21 = Nf/2+1;
v = fft(x,Nf);
wx = abs(v);
f = linspace(0,fp/2,Nf21);
subplot(3,2,2);
plot(f,wx(1:Nf21));
title('ffs syg org');
xlabel('czas [Hz]');
ylabel('|X(f)|');

M=1001;
h = fir1(M-1,0.3);  % 0.5 to wsółczynnik który przesuwa próg filtracji 
                    % jest to częstotliwość unormowana (zakładamy  ze
                    % maksymana częstotliwość wynosi 1 odpowiada połowie
                    % częstotliwości próbkowania
                    % x=focięcia/(fprobkowania/2) M-długość filtra (im
                    % dłuższy tym lepsza jakość ale większe opóźnienie
                    % sygnału
th  = 0: 1/fp : (M-1)/fp;
subplot(3,2,3);
plot(th,h);
title('odpowiedz impulsowa');
xlabel('czas [s]');
ylabel('h(t)');

Nfh = 2^10;
Nf21h = Nfh/2+1;
v = fft(h,Nfh);
wh = abs(v);
fh = linspace(0,fp/2,Nf21h);
subplot(3,2,4);
plot(fh,wh(1:Nf21h));
title('ffs odp imp');
xlabel('czas [Hz]');
ylabel('|H(f)|');

y= filter(h,1,x);
subplot(3,2,5);
plot(t,y);
title('sygnal po filtracji');
xlabel('czas [s]');
ylabel('y(t)');

v = fft(y,Nf);
wy = abs(v);
subplot(3,2,6);
plot(f,wy(1:Nf21));
title('ffs sygnal po filtracji');
xlabel('czas [Hz]');
ylabel('|Y(f)|');


