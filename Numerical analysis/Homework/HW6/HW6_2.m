N_num = zeros(1, 12);

for i = 1:12
    N_num(i) = power(2, i);
end

%using the formula to calculate the integral of sinx from 0 to 4

exact_integral = integral(@(x) sin(x), 0, 4);

Error1 = zeros(1, 12);
Error2 = zeros(1, 12);

for i = 1:12
    integral_1 = integral_Simpson(@(x) sin(x), 0, 4, N_num(i));
    Error1(i) = abs(integral_1 - exact_integral);
    integral_2 = integral_trapezoid(@(x) sin(x), 0, 4, N_num(i));
    Error2(i) = abs(integral_2 - exact_integral);
end

%calculate the convergence rate

Convergence_rate1 = zeros(1, 11);
Convergence_rate2 = zeros(1, 11);

for i = 1:11
    Convergence_rate1(i) = log2(Error1(i) / Error1(i + 1));
    Convergence_rate2(i) = log2(Error2(i) / Error2(i + 1));
end

%print the result

disp('The error of the integral of sinx from 0 to 4 using Simpson method is:');
disp(Error1);
disp('The error of the integral of sinx from 0 to 4 using trapezoid method is:');
disp(Error2);
disp('The convergence rate of the integral of sinx from 0 to 4 using Simpson method is:');
disp(Convergence_rate1);
disp('The convergence rate of the integral of sinx from 0 to 4 using trapezoid method is:');
disp(Convergence_rate2);
