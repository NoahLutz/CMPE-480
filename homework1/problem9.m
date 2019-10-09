z = 0.25*exp(-1j*pi/4);
v = 4*exp(1j*pi/2);

r = z * v;

plotcmplx(z, 'b');
hold on;
plotcmplx(v, 'g');
hold on;
plotcmplx(r, 'r');

% when multiplying complex values in polar form, the resulting angle is 
% simply the two angles summed together and the resulting magnitude is simply
% the magnitudes multiplied.