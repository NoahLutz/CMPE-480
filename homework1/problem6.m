n = 0:1:20;
y = (0.5.^n).*(0<=n & n<=10);
y2 =  (0*n).*(n>10);
stem(n,y);
grid on;
xlabel('n');
ylabel('y');
