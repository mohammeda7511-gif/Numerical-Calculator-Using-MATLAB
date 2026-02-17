function NonLinearEqn()
        format long
        funcStr = input("Enter the equation in the form of f(x) = 0 (type only f(x)) : ", 's');
        f = str2func(['@(x)' funcStr]);
        m = input("Do you want to search near a certain point? (y, n): ", 's');
        if strcmp(m, 'y')
            x = input("Enter x: ");
        else
            x = 0;
        end
        h = 0.000001;
        for i = 1:1000
            x_new = x - f(x)/((f(x+h)-f(x-h))/(2*h));

            if abs(x_new - x) < 1e-10
                break;
            end

            x = x_new;
        end
        fprintf("The found root is: %.12f\n", x);
end