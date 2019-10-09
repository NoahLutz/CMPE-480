% a1) 0.75e^(j*0)
z1 = complex(0.75, 0);
z1_mag = abs(z1);
z1_angle = angle(z1);
plotcmplx(z1, 'r');
hold on

% a2) -0.5e^(j*0)
z2 = complex(-0.5, 0);
z2_mag = abs(z2);
z2_angle = angle(z2);
plotcmplx(z2, 'b');
hold on

% a3) 1e^(j*1.5708)
z3 = 1j;
z3_mag = abs(z3);
z3_angle = angle(z3);
plotcmplx(z3, 'g');
hold on

% a4) 1e^(j*-1.5708)
z4 = 1/1j;
z4_mag = abs(z4);
z4_angle = angle(z4);
plotcmplx(z4, 'y');
hold on

% a5) 2.8284e^(j*0.7854)
z5 = 2 + 2j;
z5_mag = abs(z5);
z5_angle = angle(z5);
plotcmplx(z5, 'm');
hold on

% a6) 2.8284e^(j*2.3562)
z6 = -2 + 2j;
z6_mag = abs(z6);
z6_angle = angle(z6);
plotcmplx(z6, 'c');
grid on

