% Create a time domain signal
% Perform FFT
% Display results

clear;
close;
clc;

pkg load signal;

FFTsize = 128;

Fsampling = 40.0e6;
Fnyquist = Fsampling / 2;

% Create Time Domain Signal
% SigInTimeDomain = sin(2*pi*[1:FFTsize]*2/FFTsize);
% SigInTimeDomain = SigInTimeDomain + sin(2*pi*[1:FFTsize]*16/FFTsize);

% Define a magnitude for the sine waved at each of the frequencies
Mags = zeros(1,FFTsize);
for i = 1:8:FFTsize/2-1
  Mags(i) = 1;
end

% Sum the sine waves of each freuency together using the magnitudes defined
% above.
SigInTimeDomain = zeros(1,FFTsize);
for i = 1:FFTsize
  SigInTimeDomain = SigInTimeDomain + Mags(i)*sin(2*pi*[1:FFTsize]*i/FFTsize);
end

% Perform FFT result in array of complex numbers
ComplexInFreqDomain = fft(SigInTimeDomain);

% Align the 0 bin with the middle of the array. This makes the plots look better.
ComplexShifted = fftshift(ComplexInFreqDomain);

% Extract real magnitude term from complex
MagInFreqDomain = abs(ComplexShifted);

% Extract phase from complex
PhaseInFreqDomain = angle(ComplexShifted);

% Convert the x address from 1 to 128 to frequency
x = [1:FFTsize] - FFTsize/2;
x = x*Fsampling;

% Use iFFT to convert from frequency domain back to time domain
ComplexBackToTimeDomain = ifft(ComplexInFreqDomain);

% iFFT returns a complex number with all the imaginary numbers zero.
RealBackToTimeDomain = real(ComplexBackToTimeDomain);

% Use subplot to display the time domain signal, the magnitude and phase in a
% single figure.  The first digit represents number of rows, 2nd digit is the
% number of columns and 3rd digit indicates subplot order. You can put
% commas between the digits if you prefer. 
figure
subplot(411);
plot(SigInTimeDomain)
subplot(412);
plot(real(RealBackToTimeDomain) )
subplot(413);
plot(x,MagInFreqDomain)
subplot(414);
plot(x,PhaseInFreqDomain)

return;
