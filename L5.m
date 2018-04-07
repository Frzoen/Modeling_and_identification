close all;
clear all;

rng default;  % For reproducibility

y = evrnd(0,3,301,1);

hold on;

%for i = t
%    F = [F; numel(find(y <= i))/numel(y)];
%end

%F = @(x) sum(y<=x)/numel(y);
%stairs(t,F);

hold on
x = -20:0.1:10;

F = sum(y<=x)/numel(y);
stairs(x,F);
f = evcdf(x,0,3);
plot(x,f,'m')

L = 1:10;
M = 1:10:numel(x);
Err = [];

for l = L
    Err_tmp = 0;
    for m = M
        Err_tmp = Err_tmp + (f(x(m)) - F(x(m))^l)^2; 
    end
    Err = [Err; Err_tmp];
    
end

legend('Empirical','Theoretical','Location','NW')
Err = Err/numel(L)/numel(M);

figure(2);
plot(Err);

legend(x(M),'Error')