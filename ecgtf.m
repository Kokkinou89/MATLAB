% program ecgtf
% ECG time / frequency analysis

clear all;
close all;
clc;
display('program ecgtf');
display('ECG time / frequency analysis');

% initialization
maximumFrequency = 40; % maximum Frequency requested
samplingRate = 1000; % sampling rate of signal
segmentLength = 4096; % segment length used to calculate DFT
channel = 1;  % channel selection

% load ECG data
ecg = load('SRBPV.txt');

%Calculate number of samples in ECG signal
signalLength = numel(ecg(:,channel));

timeField = signalLength-segmentLength + 1;  % number of signal segmetns to analyzed
timeField = 10000;
frequencyField = ceil(segmentLength*maximumFrequency/samplingRate);    % number of frequency components

% Create vector of sominant frequencies
Freq = zeros(timeField,frequencyField);

% Calculate spectraCount spectra to find a mean spectrum
for i=1:timeField
   % Extract a segment from the signal of size segmentLength
   x = ecg(i:i + segmentLength -1,channel);
   % remove mean value of the segment
   x = x - mean(x);
   % Calculate the DFT using the FFT
   y = fft(x);
   % Calculate spectral power and spectral amplitude
   power = (2 * abs(y) / segmentLength) .^2;
   Freq(i,1:frequencyField) = sqrt(power(1:frequencyField,:)');
end


% 2-D time / frequency plot
figure(1);
[X, Y] = meshgrid((1:timeField)/samplingRate, 0:samplingRate/segmentLength:maximumFrequency);
mesh(X,Y,Freq');
axis([0 (timeField)/samplingRate 0 maximumFrequency min(min(Freq)) max(max(Freq))]);
view(2);
colormap('jet');
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
colorbar;
title('time - frequency analysis');


