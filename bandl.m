clc 
close all 
clear all 
fs = 500; 
duration =2; 
N = fs*duration; 
t = 0:1/fs:duration - 1/fs; 
f1 =10; 
f2= 50; 
f3= 100; 
x = sin(2*pi*f1*t)+ 1.5*sin(2*pi*f2*t)+2*sin(2*pi*f3*t); 
figure(1); 
subplot(211); 
plot(t,x); 
title('Time domain plot'); 
xlabel('Time in seconds'); 
ylabel('Amplitude'); 
X = fft(x); 
X_oneside = X(1:N/2); 
f= fs*(0: N/2 -1)/N; 
X_meg = abs(X_oneside)/(N/2); 
subplot(212); 
plot(f, X_meg); 
xlabel('Frequency in Hertz'); 
ylabel('Amplitude'); 
title('Frequency Domain Plot'); 
Ntaps = 100; 
fc1= 25;
fc2=75;
wc1 = fc1/(fs/2); 
wc2 = fc2/(fs/2); 
h= fir1(Ntaps, [wc1,wc2], 'bandpass', hamming (Ntaps+1)) 
figure(2); 
plot(h); 
figure(3); 
freqz (h, 1, 1024, fs) 
output1 = conv(x,h, 'same'); 
figure(4); 
plot(t, output1); 
title('Time domain plot of the High Pass Filtered Signal'); 
xlabel('Time in seconds'); 
ylabel('Amplitude'); 
Output1 =fft(output1); 
Output1_oneside = Output1(1:N/2); 
f = fs*(0: N/2 -1)/N; 
Output1_meg= abs (Output1_oneside)/(N/2); 
figure(5);
plot(f, Output1_meg); 
xlabel('Frequency in Hertz'); 
ylabel('Amplitude'); 
title('Frequency Domain Plot');