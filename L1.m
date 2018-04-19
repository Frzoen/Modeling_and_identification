%sin() and saw() random number generators

close all; % cleaning
clear all;

number_of_samples = 5000; % fixed numer of samples

seed = 0.712;  % initial seed for random number generator
seed2 = 0.813; % initial seed for random number generator

% initialize vectors for random numbers
random_number_sequence_x = zeros(1,number_of_samples); 
random_number_sequence_y = zeros(1,number_of_samples);

% chose which sequence is geting which seed
random_number_x = seed;
random_number_y = seed2;

% set first value in sequence
random_number_sequence_x(1) = random_number_x;
random_number_sequence_y(1) = random_number_y;

% counter for montecarlo methode
count = 0;

% generate linear space of ponints for plot
x = linspace(-1,1,number_of_samples);

% random number generating loop
for i = 2:1:number_of_samples
    random_number_x = sawtooth(15*random_number_x*pi)/2+0.5;
    random_number_sequence_x(i) = random_number_x;
    random_number_y = sawtooth(15*random_number_y*pi)/2+0.5;
    random_number_sequence_y(i) = random_number_y;
    if(sqrt(random_number_x^2+random_number_y^2) <= 0.5)
        count = count + 1;
    end
end
% generate figure for plots
figure(1);
% choose plot in figure
subplot(2,1,1);

plot(random_number_sequence_y, random_number_sequence_x,'*')

% generating legend for plot
title('Sawtooth function','fontsize',14);
hold on;
viscircles([0.5,0.5],0.5);
count/number_of_samples

subplot(2,1,2);

x = linspace(0,1,number_of_samples);

for i=1:1:number_of_samples

    pdf_(i) = sum(random_number_sequence_x < x(i))/number_of_samples;

end

plot(x,pdf_);
title('CDF','fontsize',14);
hold on;




figure(2)
random_number_sequence_x = zeros(1,number_of_samples);
random_number_sequence_y = zeros(1,number_of_samples);
random_number_x = seed;
random_number_y = seed2;
random_number_sequence_x(1) = random_number_x;
random_number_sequence_y(1) = random_number_y;

count = 0;

x = linspace(-1,1,number_of_samples);
data = sawtooth(x*15);

for i = 2:1:number_of_samples
    random_number_x = sin(15*random_number_x*pi);
    random_number_sequence_x(i) = random_number_x;
    random_number_y = sin(15*random_number_y*pi);
    random_number_sequence_y(i) = random_number_y;
    if(sqrt(random_number_x^2+random_number_y^2) <= 1)
        count = count + 1;
    end
end

plot(random_number_sequence_y, random_number_sequence_x,'*')
title('Sin function','fontsize',14);
viscircles([0,0],1);
count/number_of_samples

%plot(x,data)