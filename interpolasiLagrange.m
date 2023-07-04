function [p] = interpolasiLagrange(x,f,z)
% Data  
n = length(x);

% Regresi Linear
% Jumlahan
sum_xi = 0; %Jumlah dari x_i
sum_fi = 0; %Jumlah dari f_i
sum_xixi = 0; %Jumlah dari (x_i)^2
sum_xifi = 0; %Jumlah dari x_i*f_i
for i = 1:1:n
    sum_xi = sum_xi + x(i);
    sum_fi = sum_fi + f(i);
    sum_xixi = sum_xixi + x(i)^2;
    sum_xifi = sum_xifi + x(i)*f(i);
end
% Hasil Regresi Linear
a1 = (n*sum_xifi - sum_xi*sum_fi)/(n*sum_xixi - sum_xi^2);
a0 = (sum_fi - a1*sum_xi)/n;
for i = 1:1:n
    y(i) = a0 + a1*x(i);
end

% Polinom interpolasi Lagrange derajat n di z
p = 0;
L = ones(n);
for i = 1:1:n
    for k = 1:1:n
        if i ~= k
            L(i) = L(i) * (z - x(k)) / (x(i) - x(k));
        end
    end
    p = ceil(p + y(i)*L(i));
end
end