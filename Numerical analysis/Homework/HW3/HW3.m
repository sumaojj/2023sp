N_vector = [5, 10, 20, 40];
max_error1 = zeros(1, length(N_vector));
max_error2 = zeros(1, length(N_vector));

for i = 1:length(N_vector)

    N = N_vector(i);
    x = zeros(1, N + 1);
    y1 = zeros(1, N + 1);
    y2 = zeros(1, N + 1);

    for j = 1:N
        x(j) = (2 * j - 1) / (2 * N);
    end

    %calculate  error
    for j = 1:N
        y1(j) = linear_spline(x(j), N);
        y2(j) = cubic_spline(x(j), N);
    end

    error1 = zeros(1, N);
    error2 = zeros(1, N);

    for j = 1:N
        error1(j) = abs(y1(j) - exp(x(j)));
        error2(j) = abs(y2(j) - exp(x(j)));
    end

    %ouput the max error
    max_error1(i) = max(error1);
    max_error2 (i) = max(error2);

    fprintf('N = %d, max error1 = %e, max error2 = %e\n', N, max_error1(i), max_error2(i));

    %calculate the convergence order
    if i > 1
        order1 = log(max_error1(i - 1) / max_error1(i)) / log(2);
        order2 = log(max_error2(i - 1) / max_error2(i)) / log(2);
        fprintf('N = %d, order1 = %f, order2 = %f\n', N, order1, order2);
    end

end
