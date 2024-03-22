%the cubic spline function of the exponential function in (0,1) with N points
function y = cubic_spline(x_in, n)
    x = zeros(1, n + 1);
    y = zeros(1, n + 1);
    %M = zeros(1, n + 1);
    v = zeros(n + 1, 1);

    for i = 1:n + 1
        x(i) = (i - 1) / n;
        y(i) = exp(x(i));

    end

    for i = 2:n
        v(i) = 6 * n * (y(i + 1) - 2 * y(i) + y(i - 1));
    end

    v(1) = 6 * n * (n * (y(2) - y(1)) - 1);
    v(n + 1) = 6 * n * (exp(1) - n * (y(n + 1) - y(n)));

    A = zeros(n + 1, n + 1);

    for i = 2:n
        A(i, i - 1) = 1 / n;
        A(i, i) = 4 / n;
        A(i, i + 1) = 1 / n;
    end

    A(1, 1) = 2;
    A(1, 2) = 1;
    A(n + 1, n) = 1;
    A(n + 1, n + 1) = 2;

    M = linsolve(A, v);

    for i = 1:n

        if x(i) <= x_in && x_in <= x(i + 1)
            h = x(i + 1) - x(i);
            y = (M(i) * (x(i + 1) - x_in) ^ 3 + M(i + 1) * (x_in - x(i)) ^ 3) / (6 * h) + (y(i) * (x(i + 1) - x_in) + y(i + 1) * (x_in - x(i))) / h - h * (M(i) * (x(i + 1) - x_in) + M(i + 1) * (x_in - x(i))) / 6;
        end

    end

end
