% Octave script using Kaiserord to generate FIR coefficients
clear; close; clc; clf;
pkg load signal;

Fsamp = 100000;
Fcuts = [10000 15000];
PassbandRipple = 0.05;
Atten_dB = 60;
StopbandAttenuation = 10^(-Atten_dB/20);
mags = [1 0];  
devs = [PassbandRipple StopbandAttenuation];
[n,Wn,beta,ftype] = kaiserord(Fcuts,mags,devs,Fsamp);
hh = fir1(n,Wn,kaiser(n+1,beta),'noscale');

FFTsize = 1024;
FreqResponse = 20*log10(abs((fft(hh,FFTsize))));
  
% ii is the index of the cut-off frequency
ii = round( Fcuts(1)/Fsamp * FFTsize)
ResponseAtPass = FreqResponse(ii);
fprintf("Attenuation at Fpass is: %8.2f dB\n", ResponseAtPass);
  
% Find the first frequency worse than 3dB
index_3db = find( FreqResponse < -3.0 , 1);
Fpass_corner = index_3db / FFTsize * Fsamp;
fprintf("Fpass (-3db): %9.1f Hz\n", Fpass_corner);
    
% Plot Frequency Response
freqz(hh,1.1024,Fsamp); 
  
