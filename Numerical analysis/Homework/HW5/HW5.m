%using Richardson method to compute the derivative of the function in three cases
x_coors = [3, asin(0.8), 0];
M_order = [3, 4, 5];
fxArray = {@log, @tan, @my_fx};

for i = 1:3
    matrixs = zeros(M_order(i) + 1, M_order(i) + 1);

    for k = 1:M_order(i) + 1

        for j = k:M_order(i) + 1

            if (k == 1)
                matrixs(j, k) = phi(x_coors(i), fxArray{i}, 1/2 ^ (j - 1));
            else
                matrixs(j, k) = matrixs(j, k - 1) + (matrixs(j, k - 1) - matrixs(j - 1, k - 1)) / (4 ^ (k - 1) - 1);
            end

        end

    end

    %print the matrix
    disp(matrixs);
end
