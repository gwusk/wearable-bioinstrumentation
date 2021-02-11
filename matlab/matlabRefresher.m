%% MATLAB Tips, Tricks, and Tools

clc % clears text from Command Window
clear % removes all variables from the current Workspace
close all % removes all figures

doc clc % lookup documentation

addpath('C:\Users\folderName') % add specified folder(s) to the top fo the search path for the session

% Running code:
% by section, create sections with %%
% by line(s), F9
% using up arrow for the last thing you typed into the Command Window
% with the debugger
% Ctrl-C to cancel

%% array
schools = {'VT','UVA','CNU','ODU'}; % cell 
degrees = {'engineering','business','art'};

data = zeros(length(schools),length(degrees));

for i = 1:length(schools)
    for j = 1:length(degrees)
        data(i,j) = round(rand()*100,0);
    end
end

VTengineers = data(1,1)

%%
data = randi([0 100],length(schools),length(degrees));

%%
% logical indexing
ind = data < 20;
data(ind) = nan;

%% array to table
data = array2table(data,'VariableNames',degrees,'RowNames',schools);

%%
VTengineers = data(1,1)
VTengineers = data{1,1}
VTengineers = data.engineering(1)

%% saving arrays and tables to tables
data2 = table();
data2.year{1} = data;
data2.year{2} = randi([0 100],length(schools),length(degrees));


%% structure
data = struct();

for i = 1:length(schools)
    school = schools{i};
    for j = 1:length(degrees)
        degree = degrees{j};
        data.(school).(degree) = round(rand()*100,0);
    end
end

VTengineers = data.VT.engineering

%% plotting
close all
set(0,'DefaultFigureWindowStyle','docked')
samePlot = true;
subPlot = true;

% hold on
if samePlot
    x = 1:100;
    y = sin(x);
    y2 = cos(x);
    figure(1)
    plot(x,y)
    hold on
    plot(x,y2)
    hold off
end

if subPlot
    % subplot
    figure(2)
    subplot(2,1,1)
    plot(x,y)
    subplot(2,1,2)
    plot(x,y2)
end

%%


