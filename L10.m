close all; % cleaning
clear all;

number_of_samples = 10000;

seed = 0.712;  % initial seed for random number generator
seed2 = 0.817; % initial seed for random number generator

lambda = zeros(1,number_of_samples);
lambda(1) = 0.5;
lambda(2) = 0.5;

lambda_ex = zeros(1,number_of_samples);

% initialize vectors for random numbers
random_number_sequence_x = zeros(1,number_of_samples); 
random_number_sequence_z = zeros(1,number_of_samples);
y_sequence = zeros(1,number_of_samples); 

% chose which sequence is geting which seed
random_number_x = seed;
random_number_z = seed2;

% set first value in sequence
random_number_sequence_x(1) = random_number_x;
random_number_sequence_z(1) = random_number_z;

% random number generating loop
for i = 2:1:number_of_samples
    random_number_x = (sawtooth(20*random_number_x*pi)+1)/2;
    random_number_sequence_x(i) = random_number_x*2-1;
    random_number_z = (sawtooth(20*random_number_z*pi)+1)/2;
    random_number_sequence_z(i) = random_number_z*2-1;
end

expected= 0;

% calculating expected value of series x
for i = 1:1:number_of_samples
    expected = expected + random_number_sequence_x(i);
end

expected = expected/number_of_samples;

% variance of series x
variance = var(random_number_sequence_x);

% calculating output of system with noice
for n = 1:1:number_of_samples
    for k = 0:1:number_of_samples-1
        if(n-k >= 1)
            y_sequence(n) = y_sequence(n) + random_number_sequence_x(n-k)*lambda(k+1);
        end
    end
    y_sequence(n) = y_sequence(n) + random_number_sequence_z(n);
end

% estimation of lambda
for l = 1:1:number_of_samples
    count = 0;
    est = 0;
    for n = 1:1:number_of_samples
        if(n + l < number_of_samples)
            est = est + random_number_sequence_x(n)*y_sequence(n+l-1);
            count = count + 1;
        end
    end
    lambda_ex(l) = est / count / variance;
end
