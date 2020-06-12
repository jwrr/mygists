% Here's a simple getting started octave script
% What is the probability of an outcome after N trials?

% NOTE: When the Figure pop-up appears the chart is not displayed. I
% have to grab the corner of the chart to grow the chart and the chart
% appears.


% Do these three commands at the start of every script

% Clear the symbol table
clear;

% Close the current figure
close;

% Clear the console window
clc;

% ---------------------------------

% What are the odds of something occurring?
odds_of_occurring = 0.01;

odds_of_not_occurring = 1.0 - odds_of_occurring;

% Odds of not occurring in 1000 trials
n=1000;
seq_not_occurring(1) = odds_of_not_occurring;
for i=2:n
  seq_not_occurring(i) = seq_not_occurring(i-1) * odds_of_not_occurring;
end

% invert to get odds of occurring
seq_occurring = 1.0 - seq_not_occurring;

% Here's another way to compute the above
seq = 1 - odds_of_not_occurring.^[1:n];

% Display array to text console
% disp(seq_occurring)

% Create Graph
figure
plot(seq_not_occurring)

% Hold on... Don't diplay plot yet because more plots to come
hold on
plot(seq)

% Hold off... No we can display the plot
hold off

% Add a title, lables and grids
title("Odds of Event occurring")
xlabel("N")
ylabel("Odds")
grid on

