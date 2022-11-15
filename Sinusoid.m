
% %% Combination of Sinusoidal Waves
% 
% fs = 1000;                  %Number of Samples
% dt = 1/fs;                  %Time steps between each sample
% t = 0 : dt : 1.5 - dt;      %Total sampling time
% 
% f1 = 30;                    %Frequencies of each sine wave
% f2 = 50;
% f3 = 80;
% 
% %Define the Wave
% 
% y = 3*cos(2*pi*f1*t + 0.2) +...
%     1*cos(2*pi*f2*t-0.3) +...
%     2*cos(2*pi*f3*t+2.4);
% 
% %Plot this Wave in the Time Domain
% 
% figure (1)
% plot(t,y,'color','#4F64EE','LineWidth',1)
% xlabel('Time(s)')
% ylabel('Amplitude (m)')
% title('Time Domain','color','#1b746a','FontWeight','bold')
% xlim([0 0.5])
% 
% %% Plot this Function in Frequency Space 
% 
% Y = fft(y);                %Compute FFT
% Y_Mag = abs(Y);            %Obtain Magnitudes 
% 
% n= length(Y_Mag);          %Number of Samples 
% f = (0:n-1)*(fs/n);        %Frequency Range 
%  
% % Plotting the Frequency Magnitude Spectrum 
% figure(2)
% plot(f,Y_Mag,'color','#095778','LineWidth',1)
% xlabel('Frequency/Hz')
% ylabel('Amplitude (Arb.)')
% title('Frequency Domain','color','#1b746a','FontWeight','bold')
% 
% %% Using FFT Shift 
% 
% Y_shift = fftshift(Y);            %Reorder the Y values
% Y_shift_mag = abs(Y_shift);       %Magnitude of Shift
% f_shift = (-n/2 : n/2 -1)*(fs/n); %Frequency Range
% 
% %Plot the Shifted Spectrum 
% 
% figure(3)
% plot(f_shift,Y_shift_mag, ...
%     'color','#095778','LineWidth',1)
% xlabel('Frequency (Hz)')
% ylabel('Amplitude (Arb.)')
% title('Shifted Frequency Domain',...
%     'color','#1b746a','FontWeight','bold')


%% ---Rectangular Pulse Train--- 


w=50;                      % positive signal width %
F=2;                       % signal frequency
T=1/F;                     % signal period 
w0=2*pi*F;                 % signal pulse
ts=T/50000;                % sample time
np=2;                      % number of period
t=-np*T:ts:np*T;

y=square(w0*(t-T*w/200),w);

%Plot 
figure(4)
plot(t,y,'color','#095778','LineWidth',1)
xlabel('time (s)')
ylabel('Amplitude (m)')
title('Rectangular Pulse Train in the Time Domain', ...
    'color','#1b746a','FontWeight','bold')
axis([-0.75 0.75 -1.5 1.5])

%% Padding to Optimize the FFT

L = length(t);
n = 2^nextpow2(L);           %Apply Padding to next power of 2 

Y = fft(y,n);                %FFT over new length
Y_Mag = abs(Y);              %Take the magnitude
freq = (1/ts)*(0:(n-1))./n;  %Frequency Range


figure(5)
plot(freq,Y_Mag,'color','#095778','LineWidth',1)
xlabel('Frequency (Hz)')
ylabel('Amplitude (Arb.)')
title('Frequency Domain','color','#1b746a','FontWeight','bold')
xlim([0 50])

%% Plotting a Power Spectrum 

k = length(Y_Mag);
power = Y_Mag.^2/k;

figure(6)
plot(freq,power,'color','#095778','LineWidth',1);
xlabel('Frequency (Hz)')
ylabel('Power (Arb.)')
title('Frequency Domain Power Spectrum',...
    'color','#1b746a','FontWeight','bold')
xlim([0 30])

%Removing the Most Prominent Peak 
figure(6)
plot(freq,power,'color','#095778','LineWidth',1);
xlabel('Frequency (Hz)')
ylabel('Power (Arb.)')
title('Frequency Domain Power Spectrum','color','#1b746a','FontWeight','bold')
xlim([10 50])

figure(7)
plot(freq,Y_Mag,'color','#095778','LineWidth',1);
xlabel('Frequency (Hz)')
ylabel('Amplitude (Arb.)')
title('Frequency Domain Magnitude Spectrum','color','#1b746a','FontWeight','bold')
xlim([10 50])








