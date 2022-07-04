n = 100; %for x100 times
data_string = ['a':'z' , 'A','Z']; %our set to create data

%generate a random indexes to create random string from data_string 
generated_string = randi(numel(data_string),[1 n]);

%randomly created string itself (not used just to show how the string
%created)
random_string = data_string (generated_string);

%convert our string data to binary data for task 2 and task 3
binary_string = de2bi(generated_string,6);

%make this binary data as row vector so that we can reshape it. It will be
%used in task2 and the task3 as well
row_vector_converted = reshape(binary_string',1,numel(binary_string));

%run the script for task 1 send the generated_string and n as inputs get
%return value in array x
x = task1(generated_string, n);

%run the script for task 2 send the row_vector_converted and n as inputs get
%return value in array y
y = task2(row_vector_converted, n);

%run the script for task 3 send the row_vector_converted and n as inputs get
%return value in array z
z = task3(row_vector_converted, n);

%plot for task 1. Array x is used to collect error
%percentages in task 1
a1 = plot(x); M1 = "Task 1"; hold on;

%plot for task 2. Array y is used to collect error
%percentages in task 2
a2 = plot(y); M2 = "Task 2"; hold on;

%plot for task 3. Array z is used to collect error
%percentages in task 3
a3 = plot(z); M3 = "Task 3"; hold on;

%make a label for x axis as they represent snr values
xlabel('SNR value');

%make a label for y axis as they represent error rate in percentage
ylabel('error in [%]');

%add a legend to show which line belongs to which task
legend([a1,a2,a3], [M1, M2, M3]);