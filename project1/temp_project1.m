clear all;

% variables for tuning
f_samp = 5000;
f_tone1=1000;
%f_tone2=3000;
time_y_lower = -1;
time_y_upper = 1;
freq_y_lower = 0;
freq_y_upper = f_samp;
freq_x_lower = -4000;
freq_x_upper = 4000;



% 1a,b) x(t) setup/graph
Trep=1e-6;
t1=0:Trep:0.01;

xt=cos(2*pi*f_tone1*t1);

%xt=cos(2*pi*f_tone1*t1).*cos(2*pi*f_tone2*t1);

%A=1e-3;
%raiseindex=max(find(t1<A));
%decayindex=max(find(t1<2*A));
%xt=zeros(size(t1));
%xt(1:raiseindex)=t1(1:raiseindex)/A;
%xt(raiseindex+1:decayindex)=1-t1(1:raiseindex)/A;


figure(1);
subplot(5,1,1);
plot(t1, xt), axis([0 0.01 time_y_lower time_y_upper]), grid on, ylabel("x(t)"), xlabel("t"), title("x(t)");

% 1c) X(jf) continuous spectrum plot of x(t)0
x_sp = fft(xt);
x_sp_sf=fftshift(x_sp);
f_axis = linspace(-1/Trep/2, 1/Trep/2, length(x_sp_sf));

subplot(5,1,2);
plot(f_axis, abs(x_sp_sf)), axis([freq_x_lower freq_x_upper freq_y_lower freq_y_upper]), grid on, ylabel("X(jf)"), xlabel("f"), title("X(jf)");

% 1d) p(t) impulse train function
pt = zeros(1,length(t1));
pt(1:floor(1/f_samp/Trep):end) = 1;

% 1e) Calculate xs(t)
xst = xt .* pt;

subplot(5,1,3);
plot(t1,xst), axis([0 0.01 time_y_lower time_y_upper]), grid on, xlabel("t"), ylabel("xs(t)"), title("Xs(t)");

% 1f) Calculate Xs(jf)
xs_sp = fft(xst);
xs_sp_sf=fftshift(xs_sp);

subplot(5,1,4);
plot(f_axis, abs(xs_sp_sf)), axis([3*freq_x_lower 3*freq_x_upper 0 27]), grid on, xlabel("f"), ylabel("Xs(jf)"), title("Xs(jf)");

% 1g) Filter Xs(jf) with Hr(jf)
hr = zeros(1,length(f_axis));
for a=1:length(f_axis)
    if abs(f_axis(a)) < (f_samp/2)
        hr(a) = 1/f_samp;
    end
end
%hr((length(f_axis)/2)-(length(f_axis)/f_samp/2):(length(f_axis)/2)+(f_samp/2)) = 1/f_samp;

%subplot(5,1,5);
%plot(f_axis, hr), axis([-4000 4000 0 0.0003]);

% 1h) Plot reconstructed spectrum Xr(jf)
xr_sp = xs_sp_sf .* hr;
xr_sp(find(abs(xr_sp)<max(xr_sp)/5)) = 0;  % remove low level ocscillations
xr_sp_scaled = max(x_sp)/max(xr_sp)*xr_sp;


subplot(5,1,5);
plot(f_axis, abs(xr_sp_scaled)), axis([freq_x_lower freq_x_upper freq_y_lower freq_y_upper]), grid on, ylabel("Xr(jf)"), xlabel("f"), title("Xr(jf)");

% 1i) Calculate xr(t)
xr = iffts(xr_sp_scaled);

% 1j) Plot xr(t) next to x(t)
figure(2);
subplot(2,1,1);
plot(t1, xt), axis([0 0.01 time_y_lower time_y_upper]), grid on, ylabel("x(t)"), xlabel("t"), title("x(t)");
subplot(2,1,2);
plot(t1, real(xr)), axis([0 0.01 time_y_lower time_y_upper]), grid on, ylabel("xr(t)"), xlabel("t"), title("xr(t)");


% Functions
function output_signal = iffts(input_signal)
output_signal = ifft(ifftshift(input_signal));
end