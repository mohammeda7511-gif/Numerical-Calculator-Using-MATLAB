function firstForwardDiff()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        x = input("Enter the value of x: ");
        while true
            o = input("Do you want to calculate it using a crtain step size? (y/n): ", 's');
            if strcmp(o, 'y')
                while true
                    h = input("Enter the step size: ");
                    if h <= 0
                        fprintf("Invalid value, step size must be greter than zero.\n");
                    else
                        break;
                    end
                end
                break;
            elseif strcmp(o, 'n')
                h = 0.000001;
                break;
            else
                fprintf("Invalid Input...\n");
            end
        end
        y = (f(x+h)-f(x))/(h);
        fprintf("f'(x) using Forward Difference = %f\n", y);
end