% Filter Coefficients
b = [0.0186,0.0743,0.1114,0.0743,0.0186];
a = [1,-1.5704,1.2756,-0.4844,0.762];

[h,t] = impz(b,a,40);
figure(1);
subplot(2,1,1);
stem(t,h);
grid;
title('Impulse Response');
xlabel('n');
ylabel('h[n]');

ww = linspace(-1,1,250);

[resp,w] = freqz(b,a,ww*pi);
subplot(2,1,2);
plot(ww,abs(resp));
grid;
title('Frequency Response');
xlabel('Freq [\times \pi]');
ylabel('Magnitude');

filter_zeros = roots(b);
filter_poles = roots(a);

figure(2);
zplane(filter_zeros,filter_poles);


