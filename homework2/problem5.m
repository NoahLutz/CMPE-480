dt = 1/100;
t = 0:dt:5;

N = 100;
x = 0;
for r=1:1:N
    x = x+(1j/(2*pi*r))*exp(1j*r*2*pi*t);
end

plot(t,real(x));
grid on;
axis([0 5 -1 1]);
title('x(t)');
xlabel('t');
figure();

k = -10:1:10;
spec_mag = abs(1j./(2*pi*k));
spec_phase = angle(1j./(2*pi*k));

subplot(2,1,1);
stem(k, spec_mag);
grid on;
axis([-10 10 -0.1 0.3]);
xlabel('f [Hz]');

subplot(2,1,2);
plot(k,spec_phase);
grid on;
xlabel('f [Hz]');
