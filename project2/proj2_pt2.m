ww = linspace(-1,1,250);

% Filter 1
x1 = (0:16);
h1=[0.0030, -0.0050,0.0067,0,  -0.0252,0.0721, -0.1306, 0.1801,0.7979,0.1801, -0.1306, 0.0721,-0.0252, 0, 0.0067, -0.0050, 0.0030];

HH1 = freqz(h1,1,ww*pi);


figure(1);
subplot(2,1,1);
stem(x1, h1);   %Impulse Response
title('Impulse Response');
xlabel('n');
subplot(2,1,2);
plot(ww, abs(HH1)); % Frequency Response
title('Frequency Response');
xlabel('Freq [\times \pi]');
ylabel('Magnitude');
grid;

% Filter 2
x2 = (0:16);
h2=[0.0030, 0.0050,0.0067,  0,  -0.0252,  -0.0721,  -0.1306,-0.1801,  0.7979,-0.1801,-0.1306,  -0.0721,-0.0252,  0,  0.0067,  0.0050,  0.0030];

HH2 = freqz(h2,1,ww*pi);


figure(2);
subplot(2,1,1);
stem(x2, h2);   %Impulse Response
title('Impulse Response');
xlabel('n');
subplot(2,1,2);
plot(ww, abs(HH2)); % Frequency Response
title('Frequency Response');
xlabel('Freq [\times \pi]');
ylabel('Magnitude');
grid;


% Cascade Filter
x = (0:32);
h = conv(h1,h2);

HH = freqz(h,1,ww*pi);

figure(3);
subplot(2,1,1);
stem(x, h);     %Impulse Response
title('Impulse Response');
xlabel('n');
subplot(2,1,2);
plot(ww, abs(HH));
title('Frequency Response');
xlabel('Freq [\times \pi]');
ylabel('Magnitude');
grid;

% Calculation of freq response in freq. domain

figure(4);
HH_cascade = HH1.*HH2;

subplot(2,1,1);
plot(ww, abs(HH_cascade));
title('Calculated Frequency Response');
xlabel('Freq [\times \pi]');
ylabel('Magnitude');
grid;
subplot(2,1,2);
stem(x, h);     %Impulse Response
title('Impulse Response');
xlabel('n');
subplot(2,1,2);
plot(ww, abs(HH));
title('Frequency Response from freqz()');
xlabel('Freq [\times \pi]');
ylabel('Magnitude');
grid;
