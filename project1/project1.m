clear all;

% 1a,b) x(t) setup/graph
Trep=1e-6;

t1=0:Trep:0.01;

f_tone1=1000;

xt=0.5*cos(2*pi*f_tone1*t1);
figure(1);
plot(t1, xt), ylabel("x(t)"), xlabel("t"), title("x(t) Time Domain Graph");

% 1c) X(jf) continuous spectrum plot of x(t)0
figure(2);
x_sp = fft(xt);
x_sp_sf=fftshift(x_sp);
f_axis = linspace(-1/Trep/2, 1/Trep/2, length(x_sp_sf));
plot(f_axis, abs(x_sp_sf)), axis([-4000 4000 0 3000]), grid on, ylabel("X(jf)"), xlabel("f"), title("x(t) Spectrum Plot");

% 1d) p(t) impulse train function
f_samp = 2000;
fs = f_samp*100;
t2 = 0:1/fs:0.01;
pt=zeros(size(t2));
pt(1:fs/f_samp:end)=1;
%figure(3);
%plot(t2,pt), axis([0, 0.01, 0 2]);

% 1e) Calculate xs(t)
xst = zeros(size(t2));
for a=1:length(t2)
    xst(a) = xt(a) * pt(a);
end;
figure(3);
plot(t2,xst);