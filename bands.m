clc
clear all
close all
N=50
fs=8000;
fc1=2000;
fc2=3000;
wc1=fc1/(fs/2);
wc2=fc2/(fs/2);
h=fir1(N,[wc1 wc2], 'bandpass', blackman(N+1))
figure(5);
plot(h);
figure(6);
freqz(h,1,1024,fs)