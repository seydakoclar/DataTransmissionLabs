%function task3 gets the input signal  as a binary row vector and length to do modulation
%QAM8 and returns array of error percentages for each snr value
function q = task3(row_vector_converted, n)
    %reshape the row vector so that each row consist 3 bits meaning that one ascii
    %characters for two qam symbol
    reshaped_data_3 = reshape(row_vector_converted, length(row_vector_converted)/3, 3);

    %convert binary reshaped data to decimal to use in qammod
    final_input_3 = bi2de(reshaped_data_3);

    %array for collecting error percentages for each value if snr
    z=[];

    %loop for snr from 1 to 60
    for db = 1:1:60
        %generate signal with qammod
        signal_3 = qammod(final_input_3, 8);
        %calculate noise of the signal
        noise_3 = awgn(signal_3, db, 'measured');
        %decode signal with qamdemod using calculated noise
        decoded_signal_3 = qamdemod(noise_3, 8);
        %calculate error, mainly difference between the decoded signal with
        %the original input
        error_3 = decoded_signal_3 - final_input_3;
        %find the percentage of error
        error_percentage_3 = nnz(error_3)/n;
        %put it in array y
        z = [z error_percentage_3];
    end
    %return z
    q=z;
end