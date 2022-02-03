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
degrees = {'engineering';'business';'art'};

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
VTengineers = data.VT(1) % error

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
set(0,'DefaultFigureWindowStyle','docked') % docks rather than creating a separate window
samePlot = true;
subPlot = true;

% hold on
if samePlot
    x = 1:100; % compare to x = 1:.01:100
    y = sin(x);
    y2 = cos(x);
    figure(1)
    plot(x,y) % sin
    hold on
    plot(x,y2) % cos
    hold off
    % same as plot(x,y,x,y2)
end

if subPlot
    % subplot
    figure(2)
    subplot(2,1,1)
    plot(x,y) % sin
    subplot(2,1,2)
    plot(x,y2) % cos
end

%%
sampleX = 0:10;
sampleY = 1:11;
makeStarPlot(sampleX,sampleY) % calling a function


% this function could be a separate file or a subfunction at the end of the script
function makeStarPlot(x,y)
figure
plot(x,y,'*')
end

