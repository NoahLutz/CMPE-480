n = (0:12);
ww = linspace(0,1,512);

delta = zeros(1,13);
delta(1) = 1;

resp = pt5_filter(delta);
freq = freqz(resp,1,ww*pi);
db = mag2db(abs(freq));

subplot(2,1,1);
stem(n, resp);
title("Impulse Response of C-implemented FIR filter");
xlabel('n'), ylabel('h[n]');

subplot(2,1,2);
plot(ww,db);
title("Frequency Response of C-implemented FIR filter");
xlabel('Freq [\times\pi]'), ylabel('Magnitude (dB)');
grid;