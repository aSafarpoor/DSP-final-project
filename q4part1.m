filename = "test.wav";
[input_wave,Fs] = audioread(filename);

fft_of_input = fft(input_wave);
s= size(fft_of_input);
s = s(1);
x = 1:s;

%inp = input_wave(1:100);
l = 3;
y = UpSampler(input_wave , l);

%####define lowpass filter 
lpfilter = fir1(10 , pi/ (2 * l), 'low');
%plot(lpfilter)
%title('lpfilter')

%####use filter for interpolation
y = filter(lpfilter,1,y);

%####in this part we draw part of wave and this part after interpolation:
figure
inp = input_wave(1:100);
tiledlayout(2,1);
nexttile;
x = size(inp);x = 1:x(1); 
plot(x,inp);
title('part of input');
nexttile;
yy = UpSampler(inp , l);
yy = filter(lpfilter,1,yy);
x = size(yy);x = 1:x(1); 
plot(x,yy);
title('after interpolation');

%#### playing sounds
sound(input_wave,Fs);
sound(y,Fs);

%####compute fft
fft_of_input = fft(input_wave);
s= size(fft_of_input);
s = s(1);
x1 = 1:s;

fft_of_y = fft(y);
s= size(fft_of_y);
s = s(1);
x2 = 1:s;

%####plot for ffts
figure
tiledlayout(2,1);
nexttile;
plot(x1,fft_of_input);
title('input');
nexttile; 
plot(x2,fft_of_y);
title('after interpolation');




