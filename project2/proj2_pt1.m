n=(1:20);
n1=(1:26);
n2=(1:26);
n3=(1:23);

figure(1);
% Linearity Test
input1 = cos(n*pi/3);
input2 = cos(n*pi/4);
input3 = (2*input1) + (3*input2);

% System1 - Not Linear
output1_sys1 = system1(input1);
output2_sys1 = system1(input2);
output3_sys1 = system1(input3);

output_combined = (2*output1_sys1) + (3*output2_sys1);
subplot(2,1,1);
plot(n1, output_combined);
title('2*y1[n] + 3*y2[n]');
subplot(2,1,2);
plot(n1, output3_sys1);
title('y3[n]');

figure(2);

% System 2 - Linear
output1_sys2 = system2(input1);
output2_sys2 = system2(input2);
output3_sys2 = system2(input3);

output_combined = (2*output1_sys2) + (3*output2_sys2);
subplot(2,1,1);
plot(n2, output_combined);
title('2*y1[n] + 3*y2[n]');
subplot(2,1,2);
plot(n2, output3_sys2);
title('y3[n]');

figure(3);

% System 3 - Linear
output1_sys3 = system3(input1);
output2_sys3 = system3(input2);
output3_sys3 = system3(input3);

output_combined = (2*output1_sys3) + (3*output2_sys3);
subplot(2,1,1);
plot(n3, output_combined);
title('2*y1[n] + 3*y2[n]');
subplot(2,1,2);
plot(n3, output3_sys3);
title('y3[n]');

figure(4);

% Impulse Response of systems 2 and 3
dirac=zeros(1,length(n));
dirac(1) = 1;

impulse_resp2=system2(dirac); % FIR
impulse_resp3=system3(dirac); % IIR


stem(n2, impulse_resp2);

figure(5);
stem(n3, impulse_resp3);
