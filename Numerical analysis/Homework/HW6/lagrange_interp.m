function L = lagrange_interp(x, y)
    L = @(t) 0;
    n = length(x);

    for i = 1:n
        term = @(t) y(i);

        for j = 1:n

            if j ~= i
                term = @(t) term(t) .* (t - x(j)) / (x(i) - x(j));
            end

        end

        L = @(t) L(t) + term(t);
    end

end
