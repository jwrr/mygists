% Reduce quantization noise by half by adding half-LSB to input samples.

clear;
close;
clc;
clf;
pkg load signal;

% Create an "analog" ramp input to ADC from 0 to FS
Vfullscale = 1.0;
Nsamples = 1000;
Vin = [0:Nsamples-1] * Vfullscale ./ Nsamples;

fprintf("Nbits Quart Error  Better Quant Error\n");
for Nbits=1:16
  Nlevels = 2^Nbits;
  
  % The input is clamped to half LSB less than Full Scale before
  % adding half LSB offset
  lsb = Vfullscale / Nlevels;
  Vin_clamped = min(Vin, Vfullscale-0.501*lsb);
  Vin_adj = Vin_clamped + 0.5 * lsb;
  
  % Quantize analog input into Nlevel steps
  Vout = floor( Vin * Nlevels) / Nlevels;
  Vout_adj = floor( Vin_adj * Nlevels) / Nlevels;
  
  % Get the absolute error value for each quantized sample
  Verr = sqrt( (Vin-Vout).^2 );
  Verr_adj = sqrt( (Vin_clamped-Vout_adj).^2 );
  
  % Get the worst case error value
  Verrmax = max(Verr);
  Verrmax_adj = max(Verr_adj);
  
  % Convert to dB because that's what we do
  Verrdb = 20*log10( Verrmax / Vfullscale );
  Verrdb_adj = 20*log10( Verrmax_adj / Vfullscale );

  % Display results to command window
  fprintf(" %2i  %8.2f dB      %8.2f dB\n",Nbits,Verrdb,Verrdb_adj);

  if Nbits==3
    figure; 
    subplot(2,1,1); hold on; plot(Vin); plot(Vout); plot(Verr); hold off;
    title("Uncorrected Quantization");
    subplot(2,1,2); hold on; plot(Vin); plot(Vout_adj); plot(Verr_adj); plot(Vin_clamped); hold off;
    title("Half LSB Offset Reduces Quantization Error by Half LSB");
  endif
endfor