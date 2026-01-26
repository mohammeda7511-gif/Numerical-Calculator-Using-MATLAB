function Lagrange()
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

    syms X
    P = 0;
    for i = 1:n
        L_i = 1;
        for j = 1:n
            if i ~= j
                L_i = L_i * ((X - x(j))/(x(i) - x(j)));
            end
        end
        P = P + y(i) * L_i;
    end
    fprintf("The polynomial interpolated using Lagrange Interpolating Polynomials: ");
    disp(vpa(expand(P), 6));
end