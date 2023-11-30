
clear;
f1=49.75;	
A1=1;		
phi1=0;	

f2=50;	
A2=2;		
phi2=0;		

N=20000;	 	
fp=1000;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
Nf=N;     %przy Nf=20000 dla dużego przybliżenia na wykresie 
          %możemy zaobserwować prążki które przedstawiają częstotliwości
          %obu sinusoid
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/fp:(N-1)/fp;


x=A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2);
subplot (311);
plot (t,x);
xlabel ('czas[s]');
ylabel ('sygnal');

% wyznacz widmo
widmo=fft(x, Nf) / Nf;
N21 = Nf/2 + 1;
f = linspace (0, fp/2, N21);

% wykres czesci rzeczywistej i urojonej
xr = real (widmo);
subplot (312);
hold off;
plot (f, xr(1:N21), 'g');
hold on;
xi = imag (widmo);
plot (f, xi(1:N21), 'r');
hold off;
xlabel ('czestotl.[Hz]');
ylabel ('re(X) & im(X)');

% wykres modulu i fazy widma
widmo_amp=abs(widmo);
widmo_faz=angle(widmo);
subplot(313);
plot (f, widmo_amp(1:N21), 'k');
xlabel ('czestotl.[Hz]');
ylabel ('|X|');

set (gcf,'Position',[50 50 800 700]);

