function NDividedDiff()
    while true
        fprintf("Input x and y values at this form [x0 x1 x2 x3 ... xn]\n");
        fprintf("The number of x points must be equal to the number of y points.\n");
        while true
            x = input("Enter the values of x: ");
            if size(x, 1) ~= 1
                fprintf("Enter the values as a vector, not a matrix (don't use ; for separation)\n");
            else
                break;
            end
        end
        while true
            y = input("Enter the corresponding values of y: ");
            if size(y, 1) ~= 1
                fprintf("Enter the values as a vector, not a matrix (don't use ; for separation)\n");
            else
                break;
            end
        end
        if length(x) ~= length(y)
            fprintf("x and y must have the same size, please recheck your values again.\n");
        else
            break;
        end
    end
    n = length(x);
    DD_Table = NaN(n, n);
    DD_Table(:, 1) = y';
    for j = 2:n 

        for i = 1:(n - j + 1)
            numerator = DD_Table(i+1, j-1) - DD_Table(i, j-1);
            denominator = x(i+j-1) - x(i);
            DD_Table(i, j) = numerator / denominator;
        end
    end
    syms X
    P = DD_Table(1,1);

    term = 1;
    for k = 1:n-1
        term = term * (X - x(k));
        P = P + DD_Table(1, k+1) * term;
    end

    fprintf("The polynomial interpolated using Newton's Divided Difference: ");
    disp(vpa(expand(P), 6));
end