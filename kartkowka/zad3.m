
clear;
f1=57;	% czestotliwosc sinosoidy
A1=2;		% amplituda sinusoidy
phi1=0;	% faza sinusoidy

fp=300;		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
N=200;		%Na wykresie widma obserwujemy tylko jeden prążek co jest 
            %dowdem tego, że udało nam się unikąć wycieku dzięki doborowi 
            %odpowiednich parametrów fp i N
Nf=200;     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generuj os czasu
t=0:1/fp:(N-1)/fp;

% generuj sygnal i wykres
syg=A1*sin(2*pi*f1*t+phi1);
clf;
subplot(211);
plot(t,syg);
xlabel('czas [s]');
ylabel('x(t)');

% wyznacz widmo
widmo=fft(syg,Nf)/Nf;
widmo_amp=abs(widmo);
subplot (212);
N21 = Nf / 2 + 1;
f = linspace (0, fp/2, N21);
stem (f, widmo_amp(1:N21));
xlabel ('czest. [Hz]');
ylabel ('|X(f)|');

set (gcf,'Position',[50 50 800 700]);

