% Impedances
Zl=7;   % Lowest Impedance
Zh=145; % Highest Impedance
Z0=50;  % Filter Impedance

fc=1.2*10^9; % Cut-off frequency
er = 4.4; % Dielectric Constant of substrate
d = 1.58*(10^-3); % Height of substrate in mm
N = 6;  % Order of the filter

% Element Values - 6th order filter
g1=0.517; g2=1.414; g3=1.932; g4=1.932; g5=1.414; g6=0.517; g7=1.000;
g = [g1 g2 g3 g4 g5 g6 g7];

RS = Z0;
RL = Z0*g7;
C = [g1 g3 g5]/Z0;
L = [g2 g4 g6]*Z0;

wc = 2*pi*fc;   % Frequency in radian
L = L/wc;   % Inductance of Inductors
C = C/wc; % Capacitance of Capacitors

% Calculate the Electrical lengths of Each Component
for k=1:N
    if (mod(k,2) == 0)
        bl(k) = g(k)*Z0/Zh;
    else
        bl(k) = g(k)*Zl/Z0;
    end
end

c=299792458;    % Speed of light
lambda0=c/fc;   % Guided wave length
k0=2*pi/lambda0;    % Wave Number

% Find the width of the low, and high impedance strips in order to
%calculate the lenghts of each
Al = Zl/60*sqrt((er+1)/2)+(er-1)/(er+1)*(0.23+0.11/er);
Ah = Zh/60*sqrt((er+1)/2)+(er-1)/(er+1)*(0.23+0.11/er);    
Bl = 377*pi/(2*Zl*sqrt(er));
Bh = 377*pi/(2*Zh*sqrt(er));
Wratiodl(1) = 8*exp(Al)./(exp(2*Al)-2);      % w/d < 2
Wratiodl(2) = 2/pi*(Bl-1-log(2*Bl-1)+(er-1)/(2*er).*(log(Bl-1)+0.39-0.61/er)); %w/d>2
Wratiodh(1) = 8*exp(Ah)./(exp(2*Ah)-2);      % w/d < 2
Wratiodh(2) = 2/pi*(Bh-1-log(2*Bh-1)+(er-1)/(2*er).*(log(Bh-1)+0.39-0.61/er)); %w/d>2

if (Wratiodl(1)<2)
    Wl=d*Wratiodl(1);
elseif (Wratiodl(2)>2)
    Wl=d*Wratiodl(2);
end

if (Wratiodh(1)<2)
    Wh=d*Wratiodh(1);
elseif (Wratiodh(2)>2)
    Wh=d*Wratiodh(2);
end

epsel=(er+1)/2+(er-1)/2*1./(sqrt(1+12*d./Wl));   %effective dielctric constant in microstrip
epseh=(er+1)/2+(er-1)/2*1./(sqrt(1+12*d./Wh));   %effective dielctric constant in microstrip
betal=k0*sqrt(epsel);                            %propagation constant in microstrip
betah=k0*sqrt(epseh);                            %propagation constant in microstrip
ll = bl/betal;
lh = bl/betah;
disp('NUMBER LOW-PASS FILTER MICROSTRIP LINES:'), N
disp('LENGTHS OF LOW, AND HIGH MICROSTRIP LINES(mm):');
disp('Llow = '), ll*10^3
disp('Lhigh = '), lh*10^3
disp('WIDTHS OF LOW, AND HIGH MICROSTRIP LINES (mm):');
disp('Wlow = '), Wl*10^3
disp('Whigh = '), Wh*10^3
ZL = RL;
disp('THE LOAD RL MUST BE (Ohms)'), RL;




