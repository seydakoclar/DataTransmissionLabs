n=500; 
x=randi(16,1,n)-1; %500 random characters 
%modulation 
y = qammod(x,16); %signal generation for QAM16 modulation 
y_noise = awgn(y,0,'measured'); %add white Gousian Noise SNR 10 dB 
%demodulation 
z = qamdemod(y_noise,16); %signal demodulation 
%data visualization 
sy=scatterplot(y,1,0,'b*'); 
hold on; 
scatterplot(y_noise,1,0,'g.',sy); 
legend('Signal Constellation','Received Signal'); 
hold off; 
%error calculation 
error=z-x; %non zero is error 
error_percentage=nnz(error)/n
