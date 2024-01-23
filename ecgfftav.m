% program ecgfftav
% average ECG Fourier analysis

clear all;
close all;
clc;
display('program ecgfftav - average ECG Fourier analysis');
pkg load signal;

% initialization
spectraCount = 10000;
maximumFrequency = 40; % maximum requested Frequency
samplingRate = 1000; % sampling rate of signal
segmentLength = 4096; % segment length used to calculate the DFT - power of 2
channel = 1;  % channel number (1 - 12)

% load ECG file
ecg = load('SRBPV.txt');

% calculate number of samples in EGM
signalLength = numel(ecg(:,channel));

% Create two vectors to accumulate values
pow = zeros(segmentLength,1);

% Calculate 10000 spectra to find a mean spectrum
for i=1:spectraCount
   % Generate lim as a random value between 0 and (signalLength-segmentLength)
   rand('state',sum(100*clock));
   lim = ceil((signalLength-segmentLength)*rand(1));
   % Extract a segment from the signal of size segmentLength
   x = ecg(lim:lim + segmentLength -1, channel);
   % remove meann value
   x = x - mean(x);
   % Calculate the DFT using the FFT
   y = fft(x);
   % Calculate the power and sigmal amplitude
   spectralPower = (2*abs(y/segmentLength)).^2;
   pow = pow + spectralPower;
end

% calculate frequeencies
frequencies = linspace(0,maximumFrequency, ceil(maximumFrequency*segmentLength/samplingRate));
powerPlot = pow(1:numel(frequencies))/spectraCount;

% plot power spectrum
figure(1);
plot(frequencies,powerPlot);
xlabel('frequency (Hz)');
ylabel('spectral power');
title('power spectrum');


