% program ecgdfv
% ECG dominant frequency variability

clear all;
close all;
clc;
display('program megdfv');
display('ECG dominant frequency variability');

% initialization
maximumFrequency = 40; % maximum Frequency requested
samplingRate = 1000; % sampling rate of signal
segmentLength = 2048; % segment length used to calculate DFT
channel = 1;  % channel selection

% load MEG data
ecg = load('SRBPV.txt');

%Calculate number of samples in MEG
signalLength = numel(ecg(:,channel));

timeField = signalLength-segmentLength + 1;  % number of signal segmetns to analyzed
timeField = 10000;

% Create vector of sominant frequencies
dominantFreq = zeros(timeField,1);

% Calculate spectraCount spectra to find a mean spectrum
for i=1:timeField
   % Extract a segment from the signal of size segmentLength
   x = ecg(i:i + segmentLength -1,channel);
   % remove mean value of the segment
   x = x - mean(x);
   % Calculate the DFT using the FFT
   y = fft(x);
   % Calculate the power and sigmal amplitude
   power = (2 * abs(y) / segmentLength) .^2;
   dominantFreq(i) = find(power(2:segmentLength/2) == max(power(2:segmentLength/2)));
end

dominantFreq = dominantFreq * samplingRate / segmentLength;
% Plot dominant frequenies over time
figure(1);
plot((1:timeField)/samplingRate, dominantFreq);
grid on;
title('time evolution of dominant frequency');
xlabel('Time (sec)');
ylabel('Dominant Frequency (Hz)');
axis([0 ceil((timeField)/samplingRate) 0 max(dominantFreq)+1]);

% count variability
count = 0;
for i=2:timeField
   if (dominantFreq(i) ~= dominantFreq(i-1))
       count = count + 1;
   end
end

fprintf(1,'dominant frequency changes %d\n', count);
fprintf(1,'dominant frequency variability rate %f\n', count/timeField);
fprintf(1,'dominant frequency variability rate in Hz %f\n\n', count/(signalLength/samplingRate));



