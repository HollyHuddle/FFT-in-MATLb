%% --Combination of Sinusoidal Waves--
%      Example 1 in the FFT Guide 




fs = 1000;                  %Number of Samples
dt = 1/fs;                  %Time steps between each sample
t = 0 : dt : 1.5 - dt;      %Total sampling time

f1 = 30;                    %Frequencies of each sine wave
f2 = 50;
f3 = 80;

%Define the Wave

y = 3*cos(2*pi*f1*t + 1) +...
    1*cos(2*pi*f2*t + 2) +...
    2*cos(2*pi*f3*t - 3);

%Plot this Wave in the Time Domain
%You can change the colours of labels, titles and plots with 'color'
%followed by the hex code of a custom colour.
%I use this website for the colour codes: https://www.color-hex.com/

figure (1)
plot(t,y,'color','#4F64EE','LineWidth',1)
xlabel('Time(s)')
ylabel('Amplitude (m)')
title('Time Domain','color','#1b746a','FontWeight','bold')
xlim([0 0.5])

%% Plot this Function in Frequency Space 

Y = fft(y);                %Compute FFT
Y_Mag = abs(Y);            %Obtain Magnitudes 

n= length(Y_Mag);          %Number of Samples 
f = (0:n-1)*(fs/n);        %Frequency Range 
 
% Plotting the Frequency Magnitude Spectrum 

figure(2)
plot(f,Y_Mag,'color','#095778','LineWidth',1)
xlabel('Frequency/Hz')
ylabel('Amplitude (Arb.)')
title('Frequency Domain','color','#1b746a','FontWeight','bold')


%% Using FFT Shift 

Y_shift = fftshift(Y);            %Reorder the Y values
Y_shift_mag = abs(Y_shift);       %Magnitude of Shift
f_shift = (-n/2 : n/2 -1)*(fs/n); %Frequency Range

%Plot the Shifted Spectrum 

figure(3)
plot(f_shift,Y_shift_mag, ...
    'color','#095778','LineWidth',1)
xlabel('Frequency (Hz)')
ylabel('Amplitude (Arb.)')
title('Shifted Frequency Domain',...
    'color','#1b746a','FontWeight','bold')

