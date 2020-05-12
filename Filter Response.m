% Impedances
Z1=7; Z2=145; Z0=50;
% Cut-off frequency
fc=1.2;

j=sqrt(-1);
% Element Values
g1=0.517; g2=1.414; g3=1.932; g4=1.932; g5=1.414;
g6=0.517;g7=1.000;
% Electrical Lengths in radian
BL1=g1*Z1/Z0; BL2=g2*Z0/Z2; BL3=g3*Z1/Z0; BL4=g4*Z0/Z2; BL5=g5*Z1/Z0;
BL6=g6*Z0/Z2; BL7=g7*Z1/Z0;

k=0;
for f=[0:0.001:5]
    
A1=cos(BL1*f/fc); B1=j*Z1*sin(BL1*f/fc);
C1=(j/Z1)*sin(BL1*f/fc); D1=cos(BL1*f/fc);
A2=cos(BL2*f/fc); B2=j*Z2*sin(BL2*f/fc);
C2=(j/Z2)*sin(BL2*f/fc); D2=cos(BL2*f/fc);
A3=cos(BL3*f/fc); B3=j*Z1*sin(BL3*f/fc);
C3=(j/Z1)*sin(BL3*f/fc); D3=cos(BL3*f/fc);
A4=cos(BL4*f/fc); B4=j*Z2*sin(BL4*f/fc);
C4=(j/Z2)*sin(BL4*f/fc); D4=cos(BL4*f/fc);
A5=cos(BL5*f/fc); B5=j*Z1*sin(BL5*f/fc);
C5=(j/Z1)*sin(BL5*f/fc); D5=cos(BL5*f/fc);
A6=cos(BL6*f/fc); B6=j*Z2*sin(BL6*f/fc);
C6=(j/Z2)*sin(BL6*f/fc); D6=cos(BL6*f/fc);
M1=[A1 B1; C1 D1]; M2=[A2 B2; C2 D2];
M3=[A3 B3; C3 D3]; M4=[A4 B4; C4 D4];
M5=[A5 B5; C5 D5]; M6=[A6 B6; C6 D6];
T=M1*M2*M3*M4*M5*M6;
A=T(1,1); B=T(1,2); C=T(2,1); D=T(2,2);
Amp=2/(A+B/Z0+C*Z0+D);
k=k+1;
Y1(k)=Amp;

end;

plot([0:0.001:5], 20*log10(abs(Y1))); grid
xlabel('Frequency in Ghz');
ylabel('Magnitude of Filter Response in dB');
title('Filter Response over Frequency');

