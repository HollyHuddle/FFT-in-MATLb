%% Extended Sample - Obtaining a High Order Harmonic Power Spectrum with Spectral Filtering

%Here, the data is coming from a particle in cell code called EPOCH, which
%GetDataSDF is an external function: 
%Obtain Data from the simulation from the sdf file 

data = GetDataSDF('0005.sdf');

Bz = data.Magnetic_Field.Bz.data;   % z Component of the Magnetic Field
x  = data.Grid.Grid.x;              % the grid lines along the x axis
xmid=(x(2:end)+x(1:end-1))/2;       % shift to the centre of grid spaces for plotting samples
n = length(xmid);                   % the number of grid spaces along x

figure(1)
plot((xmid*1e6),(Bz),'color','#095778','LineWidth',1)
xlabel('x-space (\mu m)')
ylabel('Bz - Component')
title('Bz Time Domain','color','#1b746a','FontWeight','bold')
xlim([-12 0])


%% Harmonic Spectrum 
c  = 299792458;                %Speed of light in m/s
dx = 0.7e-9;                   %The length of one grid space 
dt = dx/c;                     %Sample Time Period
fs = 1/dt;                     %No. samples per second
t  = (0:n-1)/fs;               %Time range for data

%Fourier Transform of Sample
y=fft(Bz);                        %Fast Fourier Transform
Spectrum=abs(y);                         %Taking Absolute Value 
f  = (0:n-1)*(fs/n);              %Frequency Range 
driving_lambda = 800e-9;
driving_las_freq   = c /driving_lambda ;
harmonic = f ./ driving_las_freq;


figure(2)
plot(harmonic,Spectrum,'color','#095778','LineWidth',1)
xlabel('Harmonic, \omega_n / \omega_0')
ylabel('Frequency Magnitude')
title('Harmonic Spectrum from the Bz Component',...
    'color','#1b746a','FontWeight','bold')
xlim([0 30])




%% Spectral Filtering  

%FFT Shift Used to Better Visualise Data to Filter
y_shift = fftshift(y);
spectrum_shift = abs(y_shift);
f_shift = (-n/2 : n/2 -1)*(fs/n);
harmonic_shift = f_shift ./ driving_las_freq;

%Specify Limits on Frequency
f_below = 24.9; %min of frequency range
f_above = 25.0; %max of frequency range 


%Use Logical Indexing to force other frequencies to 0
spectrum_shift(abs(harmonic_shift) < f_below) = 0;
spectrum_shift(abs(harmonic_shift) > f_above) = 0;

%Plot the New Spectrum 
figure 
plot(harmonic_shift,spectrum_shift,...
    'color','#095778','LineWidth',1)
xlabel('Harmonic, \omega_n / \omega_0')
ylabel('Frequency Magnitude')
title('Filtered Harmonic Spectrum',...
    'color','#1b746a','FontWeight','bold')
xlim([-50 50])


%Inverse Fourier Transforms 
ifftshift(spectrum_shift);
wave = ifft(spectrum_shift);

figure 
plot((xmid*1e6),wave,'color',...
    '#095778','LineWidth',1)
xlabel('x-space (\mu m)')
ylabel('Amplitude')
title('25th Harmonic',...
    'color','#1b746a','FontWeight','bold')
xlim([-0.1 0])
ylim([-300 300])





%Visualising the Spectrum after FFTShift 
% %Plot the Shifted Spectrum
% figure 
% plot(harmonic_shift,spectrum_shift,'color','#095778','LineWidth',1)
% xlabel('Harmonic, \omega_n / \omega_0')
% ylabel('Frequency Magnitude')
% title('Harmonic Spectrum from the Bz Component',...
%     'color','#1b746a','FontWeight','bold')
% xlim([-30 30])















