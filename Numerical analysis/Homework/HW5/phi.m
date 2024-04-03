function y = phi(x, fx, h)
    y = (fx(x + h) - fx(x - h)) / (2 * h);
end
