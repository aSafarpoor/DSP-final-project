x = [];
for ii=1:1024
    x = [x ; sin(pi * ii/ 256) ];
end
X = fft(x , 1024) ; 
R = DownSampler(X , 2);
r = ifft(R , 512);
Y = UpSampler(R , 2);
y = ifft(Y , 1024);



tiledlayout(3,1);
nexttile;
plot(1:1024 , x);
title('x');
nexttile;
plot(1:512 , r);
title('r');
nexttile; 
plot(1:1024 , y);
title('y');








