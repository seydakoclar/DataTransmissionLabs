%function task2 gets the input signal as a binary row vector and length to do modulation
%QAM4096 and returns array of error percentages for each snr value
function q = task2(row_vector_converted, n)
    %reshape the row vector so that each row consist 12 bits meaning that two ascii
    %characters for one qam symbol
    reshaped_data_2 = reshape(row_vector_converted, length(row_vector_converted)/12, 12);

    %convert binary reshaped data to decimal to use in qammod
    final_input_2 = bi2de(reshaped_data_2);

    %array for collecting error percentages for each value if snr
    y =[];

    %loop for snr from 1 to 60
    for db = 1:1:60
        %generate signal with qammod
        signal_2 = qammod(final_input_2, 4096);
        %calculate noise of the signal
        noise_2 = awgn(signal_2, db, 'measured');
        %decode signal with qamdemod using calculated noise
        decoded_signal_2 = qamdemod(noise_2, 4096);
        %calculate error. mainly difference between the decoded signal with
        %the original input
        error_2 = decoded_signal_2 - final_input_2;
        %find the percentage of error
        error_percentage_2 = nnz(error_2)/n;
        %put it in array y
        y = [y error_percentage_2];
    end
    %return y
    q=y;
end
