clear 
clc
close all

% load pressureSensor output table 
data = readtable('C:\Users\username\git\wearable-bioinstrumentation\data\pressureSensorData.csv');

% remove portions of the data when you were not lying on the sensor (when pressed was false)
time = data.time(logical(data.pressed));
resp = data.voltage(logical(data.pressed));

% specify plotsOn true or false
plotsOn = false;

% specify timeSteps
totalTime = 5*60;
stepTime = 30;
timeSteps = 0:stepTime:totalTime;

% initialize output table
output = array2table(nan([length(timeSteps)-1,3]),'VariableNames',{'time','rr','rr_fft'});

% loop through each window of time and run analyzeRESP to calculate RR and
% RR FFT, save respiration rates to output table
for i = 2:length(timeSteps)
    % only look at specificed portion of the time and resp signals
    startTime = timeSteps(i-1);
    endTime = timeSteps(i);
    ind = time >= startTime & time < endTime;
    timeTemp = time(ind);
    respTemp = resp(ind);
    
    % run analyzeRESP function
    [rr,rr_fft] = analyzeRESP(timeTemp,respTemp,plotsOn);
    
    % save respiration rates to output table
    output.time(i-1) = timeSteps(i);
    output.rr(i-1) = rr;
    output.rr_fft(i-1) = rr_fft;
end

% plot respiration rate over time
figure
plot(output.time,output.rr,'.-')
hold on 
plot(output.time,output.rr_fft,'.-')
hold off