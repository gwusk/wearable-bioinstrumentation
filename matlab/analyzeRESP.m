% analyzeRESP calculates respiration rate using time and frequency domain
% analyses

function [rr,rr_fft] = analyzeRESP(time,resp,plotsOn)
    % INPUTS: 
    % time: elapsed time (seconds)
    % resp: output from pressure sensor (voltage)
    % plotsOn: true for plots, false for no plots
    
    % OUTPUT:
    % rr: respiration rate (brpm) found from time domain data
    % rr_fft: respiration rate (brpm) found from frequency domain data

    % save orgiinal data
    time_raw = time;
    resp_raw = resp;

    % calculate fs
    fs = 0; % FILL IN CODE HERE

    % remove offset
    resp = resp - mean(resp);

    % bandpass pass filter resp
    w1 = 0; % FILL IN CODE HERE
    w2 = 0; % FILL IN CODE HERE
    resp = bandpass(resp,[w1 w2],fs);

    % find peaks
    pks = findpeaks(resp); % FILL IN CODE HERE (look at findpeaks documentation)

    % calcuate rr
    rr = 0; % FILL IN CODE HERE

    % fft
    P1 = 0; % FILL IN CODE HERE (look at fft documentation)
    f = 0; % FILL IN CODE HERE (look at fft documentation)

    % calcuate rrFft
    rr_fft = 0; % FILL IN CODE HERE (hint: look at max documentation)

    if plotsOn
        figure % FILL IN CODE HERE to add legends, axes labels, and * for peaks
        subplot(3,1,1) 
        plot(time_raw,resp_raw)
        
        subplot(3,1,2)
        plot(time,resp)
        
        subplot(3,1,3)
        plot(f,P1)
    end
end