clear all;
close all;
fp=1000;
N=1000;
t=0:1/fp:(N-1)/fp;
x=sin(2*pi*t);


%hold on;
%figure(1);
subplot(2,2,1);

plot(t,x,'b');
title('sinusoida');
xlabel('czas [s]');
ylabel('x(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%

y=randn(1,N);
%figure(2);
subplot(2,2,2);

plot(t,y,'r');
title('szum naturalny / gaussa');
xlabel('czas [s]');
ylabel('y(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%

z=rand(1,N);
%figure(3);
subplot(2,2,3);

plot(t,z,'y');
title('szum rownomierny');
xlabel('czas [s]');
ylabel('z(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);
v=chirp(t,2,t(end),10);
plot(t,v,'g');
title('chirp');
xlabel('czas [s]');
ylabel('v(t)');

%hold off;