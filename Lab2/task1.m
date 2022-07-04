%function task1 gets the input signal and length to do modulation
%QAM64 and returns array of error percentages for each snr value
function q = task1(generated_string, n)
    %array for collecting error percentages for each value if snr
    x =[];

    %loop for snr from 1 to 60
    for db = 1:1:60
        %generate signal with qammod
        signal_1 = qammod(generated_string, 64);
        %calculate noise of the signal
        noise_1 = awgn(signal_1, db, 'measured');
        %decode signal with qamdemod using calculated noise
        decoded_signal_1 = qamdemod(noise_1, 64);
        %calculate error, mainly difference between the decoded signal with
        %the original input
        error_1 = decoded_signal_1 - generated_string;
        %find the percentage of error
        error_percentage_1 = nnz(error_1)/n;
        %put it in array x
        x = [x error_percentage_1];
    end
    %return x
    q=x;
end