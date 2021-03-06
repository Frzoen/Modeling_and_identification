close all; % cleaning
clear all;

r=2;

number_of_samples = 5000;

x = linspace(-r,r,number_of_samples);

seed = 0.712;  % initial seed for random number generator
seed2 = 0.813; % initial seed for random number generator


y = zeros(1,number_of_samples);
y(1) = seed;
r_ = zeros(1,number_of_samples);
r_(1) = seed2;

y_ = zeros(1,number_of_samples);
cdf_in_1 = zeros(1,number_of_samples);

y(1) = -r+(2*r)*(sawtooth(20*y(1)*pi)+1)/2;
r_(1) = (sawtooth(20*r_(1)*pi)+1)/2;

for i = 2:1:number_of_samples
   y(i) = -r+(2*r)*(sawtooth(20*y(i-1)*pi)+1)/2;
   r_(i) = (sawtooth(20*r_(i-1)*pi)+1)/2;
   while (r_(i) > 2*sqrt(1-(y(i)*y(i))/(r*r))/(pi*r))
       y(i) = -r+(2*r)*(sawtooth(20*y(i)*pi)+1)/2;
       r_(i) = (sawtooth(20*r_(i)*pi)+1)/2;
   end
end

%random numbers
%figure(1);
%plot(r_,'.');
%title('Random numbers generated');

% 2x
figure(2);

for i=1:1:number_of_samples

    cdf_in_1(i) = sum(y < x(i))/number_of_samples;

end

subplot(2,2,1);
plot(x,2*sqrt(1-(x.*x)/(r*r))/(pi*r));
title('Propability density function');
subplot(2,2,2);
plot(x,1/2+(x.*sqrt(1-x.*x./r/r)/pi/r)+asin(x./r)/pi);
title('Cumulative distribution function');
subplot(2,2,3);
plot(y,r_,'.');
title('Numbers generated by inverse method');
subplot(2,2,4);
stairs(x,cdf_in_1);
title('CDF of generated numbers');

