clc
close all
clear all
N=50;
fs=4000;
fc=1000;
wc=fc/(fs/2);
h=fir1(N,wc,'low',hamming(N+1));
figure(5);
plot(h);
figure(6);
freqz(h,1,1024,fs);