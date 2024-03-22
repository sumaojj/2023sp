%the linear spline function of the exponential function in (0,1) with N points
function y = linear_spline(x_in, n)
    x = zeros(1, n + 1);
    y = zeros(1, n + 1);
    a = zeros(1, n);
    b = zeros(1, n);

    for i = 1:n + 1
        x(i) = (i - 1) / n;
        y(i) = exp(x(i));
    end

    for i = 1:n
        a(i) = (y(i + 1) - y(i)) / (x(i + 1) - x(i));
        b(i) = y(i) - a(i) * x(i);
    end

    for i = 1:n

        if x(i) <= x_in && x_in <= x(i + 1)
            y = a(i) * x_in + b(i);
        end

    end

end
