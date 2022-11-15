%% Rectangular Pulse 

%% ---Rectangular Pulse Train--- 


w=50;                      % positive signal width %
F=2;                       % signal frequency
T=1/F;                     % signal period 
w0=2*pi*F;                 % signal pulse
ts=T/50000;                % sample time
np=2;                      % number of period
t=-np*T:ts:np*T;

%MATLAB may prompt you to download a package to use this square function

y=square(w0*(t-T*w/200),w); 

%Plot in the Time Domain 

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


%Plot the magnitude 

figure(5)
plot(freq,Y_Mag,'color','#095778','LineWidth',1)
xlabel('Frequency (Hz)')
ylabel('Amplitude (Arb.)')
title('Frequency Domain','color','#1b746a','FontWeight','bold')
xlim([0 30])

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

