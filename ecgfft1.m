% program ecgfft1
% ECG Fourier analysis

clear all;
close all;
clc;
display('program ecgfft1 - ECG Fourier analysis');
pkg load signal;

% initialization
maximumFrequency = 40; % maximum requested Frequency
samplingRate = 1000; % sampling rate of signal
segmentLength = 4096; % segment length used to calculate the DFT - power of 2
channel = 1;  % channel number (1 - 12)

% load ECG file
ecg = load('SRBPV.txt');

% calculate number of samples in EGM
signalLength = numel(ecg(:,channel));

% generate lim as a random value between 0 and (signalLength-segmentLength)
lim = randi(signalLength-segmentLength);

% extract a segment from the signal of size segmentLength
x = ecg(lim:lim + segmentLength -1,channel);

% remove meann valus
x = x - mean(x);

% create a corresponding time vector (starting at 0) for the segment
t = linspace(0,round(segmentLength/samplingRate),segmentLength);

% plot signal segment
figure(1);
plot(t,x);
%axis('tight');
grid on;
xlabel('rime(sec)');
ylabel('ECG(mV)');
title('ECG signa;');

% calculate the DFT using the FFT
y = fft(x);

% calculate spectral power and frequencies
spectralPower = (2*abs(y/segmentLength)).^2;
frequencies = linspace(0,maximumFrequency, ceil(maximumFrequency*segmentLength/samplingRate));


% plot power spectrum
figure(2);
plot(frequencies,spectralPower(1:length(frequencies)));
xlabel('frequency (Hz)');
ylabel('spectral power');
title('power spectrum');


