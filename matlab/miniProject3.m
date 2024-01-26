clear 
clc
close all

%% Connect Arduino

a = arduino();

%% Collect and Save Data

% define variables and call pressureSensor function
sampleTime = 0;
thresh = 0;
livePlot = false;
pauseTime = 0;
[data] = pressureSensor(a,sampleTime,thresh,livePlot,pauseTime);

% calcuate data acqusition rate
fs = 0;

% calculate R2 using R1, Vin, and Vout
r2 = 0;

% save pressureSensor output table to a study array, table, or structure
study = data;

% save pressureSensor output table to a csv in your data folder
writetable(data,'C:\Users\username\git\wearable-bioinstrumentation\data\pressureSensorData.csv')

%% Figure 1. Calculate Resistance

figure
plot(data.time,data.voltage)

%% Figure 2. Changing R1

figure
plot(data.time,data.voltage)

%% Figure 3. Respiration

figure
plot(data.time,data.voltage)
