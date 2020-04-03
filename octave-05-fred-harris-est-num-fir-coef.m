clear;
close;
clc;
clf;
pkg load signal;

% =============================================================================
% Define FIR Filter

Fpass = 10000;    % 3 dB
Fstop = 15000;
Fsamp = 192000;
Fnyq = Fsamp / 2;
Atten_dB = 40;

% =============================================================================
% ESTIMATE NUMBER OF TAPS

% Fred Harris Approximation from page 216 of his book 
% Multirate Signal Processing for Communication Systems (2004)
Fdelta = Fstop - Fpass;
Ntaps = (Fsamp / Fdelta) * (Atten_dB / 22)

% =============================================================================
% ROUND TO NEAREST ODD FOR LINEAR PHASE

Ntaps = 2*floor(Ntaps/2) + 1
Ntaps = 31
Norder = Ntaps - 1;

% =============================================================================
% CALCULATE TAP COEFFICIENTS

% Normalize Pass frequency to Nyquist
Wn = Fpass / Fnyq;
FIRcoef = fir1(Norder, Wn, 'low');

FFTsize = 1024;
step = 1/FFTsize;
% PLOT Frequency Response
x = (-0.5:step:0.5-step)*Fsamp;
FreqResponseComplex = fftshift(fft(FIRcoef,FFTsize));
Mag = abs( FreqResponseComplex );
Mag_dB = 20*log10(Mag);
Phase = angle( FreqResponseComplex ) / pi;
figure
subplot(2,1,1)
plot( x , Mag_dB )
axis ( [0 2*Fstop -100 20] )
title('FIR Filter Frequency Response')
grid on
subplot(2,1,2)
plot( x , Phase )
axis ( [0 2*Fstop -1.0 1.0] )
title('Fir Filter Phase Response')




