clear all;
N = 10000;
x = linspace(0,1,10000);
hold on;
figure(1)
title('SIN(a*x)','fontsize',14);

for a = 2:2:12
    num = a/2;
    subplot(2,3,num)
    plot(x,sin(a*x)/2+0.5);
    title(['SIN(a*x); a = ' num2str(a)],'fontsize',14);
    hold on;
    plot(x,x);
end