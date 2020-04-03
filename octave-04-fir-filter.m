% Calculate FIR filter coefficients and frequency response
clear; close; clc; clf;
pkg load signal;

Ntap = 69; % use Fred Harris Approximation
dB = 40;
Norder = Ntap - 1;
Fsamp = 100000;
Fnyq = Fsamp / 2;
Fpass  = 10000 / Fnyq;

% Iterate until pass-band edge is better than -3dB
Fudge=1.00;
for i=1:100

  % Create the filter coefficients
  Fpass2 = Fudge*Fpass;
  Coef = fir1(Norder, Fpass2, 'low');

  % Generate frequency response for the filter
  FFTsize = 1024;
  x = [0:FFTsize-1] * Fsamp / FFTsize;
  FreqResponse = 20*log10(abs((fft(Coef,FFTsize))));

  % Find response at passband edge
  ii = round( Fpass * FFTsize / 2);
  ResponseAtPass = FreqResponse(ii);

  % If not good enough then make Fpass a little larger
  if ResponseAtPass < -3.0
    Fudge = Fudge + 0.004;
  else
    fprintf("Fpass adjusted to: %9.1f Hz\n", Fpass2*Fnyq);
    fprintf("Attenuation at Fpass is: %8.2f dB\n", ResponseAtPass);
    break;
  endif
  
end

% Only in Matlab. Not in Octave yet
% fvtool(Coef, 1);

figure; plot(x,FreqResponse); axis( [0 4*Fpass*Fnyq -80 10] );


