filename = "test.wav";
[input_wave ,Fs] = audioread(filename);

%downsampling:
m = 2;
y = DownSampler(input_wave , m);
%sound(y,Fs);

%####draw fft of downsampled wave
%fft_of_y = fft(y);
%s= size(fft_of_y);
%s = s(1);
%x1 = 1:s;
%plot(x1,fft_of_y);
%title('fft of downsampled');

m = 4;
y = DownSampler(input_wave , m);
l = 4;
y = UpSampler(y , l);
sound(y,Fs);


%####fft for this part and compare with input:
figure
tiledlayout(2,1);
nexttile;
fft_of_input = fft(input_wave);
s = size(fft_of_input);s=1:s(1);
plot(s,fft_of_input);
title('input');
nexttile; 
fft_of_y = fft(y);
s = size(fft_of_y);s=1:s(1);
plot(s,fft_of_y);
title('after operation');

