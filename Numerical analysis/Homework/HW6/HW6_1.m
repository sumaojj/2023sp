N_num = [5, 10, 15, 20, 25, 30, 35, 40];

exact_integral = 0.2 * (tan(5) - tan(-5));
disp("Exact integral result:");
disp(exact_integral);

for i = 1:length(N_num)
    N = N_num(i);
    x_1 = zeros(1, N + 1);
    x_2 = zeros(1, N + 1);
    y_1 = zeros(1, N + 1);
    y_2 = zeros(1, N + 1);

    for j = 1:N + 1
        x_1(j) = 1 - 2 * (j - 1) / N;
        x_2(j) = -cos((j) * pi / (N + 2));
        y_1(j) = func_1(x_1(j));
        y_2(j) = func_1(x_2(j));
    end

    L_1 = lagrange_interp(x_1, y_1);
    L_2 = lagrange_interp(x_2, y_2);

    integral_1 = integral(@(x) L_1(x), -1, 1);
    integral_2 = integral(@(x) L_2(x), -1, 1);

    fprintf('N = %d\n', N);
    fprintf('integral_1 = %.8f\n', integral_1);
    fprintf('integral_2 = %.8f\n', integral_2);

    error_1 = abs(integral_1 - exact_integral);
    error_2 = abs(integral_2 - exact_integral);

    fprintf('error_1 = %.8f\n', error_1);
    fprintf('error_2 = %.8f\n', error_2);
end
