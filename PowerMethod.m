function PowerMethod()
    while true
            a = input("Enter the matrix (columns separated by spaces and rows separated by a ;) : ");
            if size(a, 1) ~= size(a, 2)
                fprintf("Invalid input, the matrix must be square.\n");
            else
                break;
            end
    end
    while true
        x = input("Enter an initial guess (separated by ;): ");
        if size(x, 1) ~= size(a, 1)
            fprintf("Dimensions error.\n");
        elseif norm(x) == 0
            fprintf("The initial guess vector mustn't be a zero vector.\n");
        else
            break;
        end
    end
    while true
        l = input("Do you want to calculate it using certain number of iterations? (y, n): ", 's');
        z = 0;
        if strcmp(l, 'y')
            while true
                m = input("Enter the number of iterations: ");
                if m <= 0 || mod(m, 1) ~= 0
                    fprintf("The number of iterations must be a positive integer.\n");
                else
                    z = 1;
                    break;
                end
            end
        elseif strcmp(l, 'n')
            m = 1000;
            break;
        else
            fprintf("Invalid input, use only (y, n).\n");
        end
        if z == 1
            break;
        end
    end
    
    n = size(a, 1);
    A = a;

    for k = 1:n
        if k > 1
            A = A - lambda_prev * (v_prev * v_prev');
            x = rand(n, 1);
        end
        y = x;
        
        for j = 1:m
            x_prev = y / norm(y, inf);
            y = A * x_prev;
            maxi = y(1);
            max_idx = 1;
            for i = 2:n
                if abs(y(i)) > abs(maxi)
                    maxi = y(i);
                    max_idx = i;
                end
            end
            maxi = y(max_idx);
            lambda = maxi / x_prev(max_idx);
            y = y / maxi;
        end

        lambda_prev = lambda;
        v_prev = y / norm(y);
        
        fprintf("\nEigenvalue %d ≈ %.6f\n", k, lambda);
        fprintf("Corresponding eigenvector (normalized with largest component = 1):\n");
        disp(y);
    end
end