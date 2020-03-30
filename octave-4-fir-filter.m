clear;
close;
clc;

pkg load signal;

FFTsize = 128;

Fsampling = 40.0e6;
Fnyquist = Fsampling / 2;

% SigInTimeDomain = sin(2*pi*[1:FFTsize]*2/FFTsize);
% SigInTimeDomain = SigInTimeDomain + sin(2*pi*[1:FFTsize]*16/FFTsize);


Mags = zeros(1,FFTsize);

for i = 1:8:FFTsize/2-1
  Mags(i) = 1;
end

SigInTimeDomain = zeros(1,FFTsize);
for i = 1:FFTsize
  SigInTimeDomain = SigInTimeDomain + Mags(i)*sin(2*pi*[1:FFTsize]*i/FFTsize);
end

%SigInTimeDomain = zeros(FFTsize);
%for i = 2:16:(FFTsize/2)-1
%  SigInTimeDomain = SigInTimeDomain + sin(2*pi*[1:FFTsize]*i/FFTsize);
%end

SigInFreqDomain = fft(SigInTimeDomain);
SigShifted = fftshift(SigInFreqDomain);
MagInFreqDomain = abs(SigShifted);
PhaseInFreqDomain = angle(SigShifted);

x = [1:FFTsize] - FFTsize/2;
x = x*Fsampling;

figure
subplot(311);
plot(SigInTimeDomain)
subplot(312);
plot(x,MagInFreqDomain)
subplot(313);
plot(x,PhaseInFreqDomain)

return;


% =================================

Fsample = 1.0e6;
OverSample = 6;
Fnyquist = Fsample / 2;
Fmax = Fsample/OverSample;
Fsignal = [0.25 0.5 0.75 1.00];

CyclesToShow = 5;
SlowestFrequency = Fsignal(1);
TotalSamples = CyclesToShow * OverSample/SlowestFrequency;

sig = zeros(1,TotalSamples);
for s = Fsignal
  sig = sig + sin(2*pi*[1:TotalSamples]*s*Fmax/Fsample);
end

figure
plot(sig)
title("Signal in Time Domain")
xlabel("Sample N")
ylabel("Amplitude")





return;



TotalSamples = 1000;
Fsample = 1000;
Fsig(1) = 10;
Fsig(2) = 20;

sig1 = sin(2*pi*[1:TotalSamples]*Fsig(1)/Fsample);
sig2 = sin(2*pi*[1:TotalSamples]*Fsig(2)/Fsample);

figure
plot(sig1)
hold on
plot(sig2)
hold off

return


Fsignal = 1.0e5;
Fsample = 1.0e6;
SamplesPerCycle = Fsample / Fsignal;
NumCycles = 5;
TotalSamples = NumCycles * SamplesPerCycle;

SignalIn = sin(2*pi*[1:TotalSamples]/SamplesPerCycle);

figure
plot(SignalIn)

return;

samples_per_cycle = 1024;
num_cycles = 5;
total_samples = num_cycles * samples_per_cycle;

sin_x = sin(2*pi*[1:total_samples]/samples_per_cycle);

figure
plot(sin_x)


return;


Fco = 10000;
Fmax = 15000;
Fsample = 6*Fco;
Fnyquist= Fsample / 2;
Wn = Fco / Fnyquist;
  
test_signal = 0;
for freq=4000:4000:20000
  test_signal = sin(2*pi*[1:1024]*freq/Fsample);
end


figure
title("Test Signal - Time Domain");
xlabel("Time");
ylabel("signal");
grid;
plot(test_signal)

for i=11:2:21
  taps = i;
  Fdelta = Fmax - Fco;
  coef = fir1(taps-1, Wn, 'low');
  % disp(coef)
  
  
  
end
    

figure
title("Coefficients");
xlabel("Tap N");
ylabel("Coef");
grid
plot(coef)

