% show that quantization noise decreases by 6dB per bit

clear;
close;
clc;
clf;
pkg load signal;

% The error reduces by half for each additional bit which equates to -6dB
ExpectedDecreasePerBit = 20*log10(1/2)

% Let's see if that holds with a simple simulation

% Create an "analog" ramp input to ADC from 0 to FS
Vfullscale = 1.0;
Nsamples = 1000;
Vin = [0:Nsamples-1] * Vfullscale ./ Nsamples;

fprintf("Nbits Quart Error  Expected  Rule of Thumb\n");
for Nbits=1:16
  Nlevels = 2^Nbits;
  
  % Quantize analog input into Nlevel steps
  Vout = floor( Vin * Nlevels) / Nlevels;
  
  % Get the absolute error value for each quantized sample
  Verr = sqrt( (Vin-Vout).^2 );
  
  % Get the worst case error value (it should be 1/2 LSB)
  Verrmax = max(Verr);
  
  % Convert to dB because that's what we do
  Verrdb = 20*log10( Verrmax / Vfullscale );
  
  Expected = 20*log10( (1/2^Nbits ) );
  RuleOfThumb = -6 * Nbits; 
  fprintf(" %2i  %8.2fdB  %8.2fdB  %8.2f\n",Nbits,Verrdb,Expected,RuleOfThumb);

endfor
