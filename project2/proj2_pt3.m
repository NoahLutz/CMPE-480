% Filter Coefficients
b = [0.0186,0.0743,0.1114,0.0743,0.0186];
a = [1,-1.5704,1.2756,-0.4844,0.762];

[h,t] = impz(b,a,40);
figure(1);
plot(t,h);

