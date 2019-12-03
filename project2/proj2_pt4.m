ww = linspace(0,1,512);

order = 12;
f = [0 0.2 0.35 0.65 0.8 1];
a = [0 0 1 1 0 0];

b = firpm(order, f, a);

[h,w] = freqz(b,1,ww*pi);
db = mag2db(abs(h));
[imp,n] = impz(b,1,order+2);

subplot(2,1,1);
stem(n,imp);
title(sprintf("%dth Order FIR Impulse Response", order));
xlabel('n'), ylabel('h[n]');


subplot(2,1,2);
plot(ww,db);
axis([0 1 -60 10]);
title(sprintf("%dth Order FIR Frequency Response", order));
xlabel('Frequency [\times\pi]'), ylabel('Magnitude (dB)');
grid;

% Mark the critical points
hold on;
plot(ww(180), db(180), 'ro');
annot = sprintf("(%.2f, %.2f)", ww(180), db(180));
text(ww(180)-0.059, db(180) + 5, annot);

hold on;
plot(ww(104), db(104), 'ro');
annot = sprintf("(%.2f, %.2f)", ww(104), db(104));
text(ww(104)-0.059, db(104) + 5, annot);

hold on;
plot(ww(334), db(334), 'ro');
annot = sprintf("(%.2f, %.2f)", ww(334), db(334));
text(ww(334)-0.059, db(334) + 5, annot);

hold on;
plot(ww(410), db(410), 'ro');
annot = sprintf("(%.2f, %.2f)", ww(410), db(410));
text(ww(410)-0.059, db(410) + 5, annot);