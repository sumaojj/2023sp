function L = integral_Simpson(f, a, b, n)
    h = (b - a) / n;
    x = a:h:b;
    L = 0;

    for i = 1:n
        L = L + h / 6 * (f(x(i)) + 4 * f((x(i) + x(i + 1)) / 2) + f(x(i + 1)));
    end

end
