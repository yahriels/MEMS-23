clear all
format long


    o=load('TIP-DATA_0');
    disp=o(:,2);
    time=o(:,1);
    Voltage=o(:,3);
%     figure(1),subplot(2,1,2),plot(time,Voltage,'-b'),hold on

% VOLTAGE DATA ANALYZED USING MATLAB FFT ALGORITHM BELOW...
    freq=1.d0/(time(2)-time(1));
%     min1=length(disp);
    min1=length(Voltage);
    mn=2^(floor(log(min1)/log(2.d0))-1);
    time_in=time(1+min1-mn:min1);
%     y_in=disp(1+min1-mn:min1);
    y_in=Voltage(1+min1-mn:min1);
    y=abs(fft(y_in));
    f=(freq/2.d0)*linspace(0,1,mn/2+1);
%     figure(1),subplot(2,1,1),plot(time_in,y_in,'-b'),hold on
%     figure(1),subplot(2,1,2),plot(f,y(1:mn/2+1),'-r'),hold on