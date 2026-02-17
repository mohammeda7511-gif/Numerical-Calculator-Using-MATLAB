function RungeKutta()

    funcStr = input("Enter the ODE (y' = f(x,y)) (enter only f(x,y)): ", 's');
    f = str2func(['@(x, y)' funcStr]);

    x0 = input("Enter the initial x value: ");
    y = input("Enter the initial y value: ");
    x_target = input("Enter the value of x that the solution is needed at: ");

    while true
        h = input("Enter the step size: ");
        if h > 0 && h < abs(x_target - x0)
            break;
        else
            fprintf("Invalid step size.\n");
        end
    end

    xn = x0;

    while xn < x_target

        h = min(h, x_target - xn);

        k1 = f(xn, y);
        k2 = f(xn + 0.5*h, y + 0.5*h*k1);
        k3 = f(xn + 0.5*h, y + 0.5*h*k2);
        k4 = f(xn + h, y + h*k3);

        y = y + (h/6)*(k1 + 2*k2 + 2*k3 + k4);

        xn = xn + h;
    end

    fprintf("The solution at x = %.6f is: %.12f\n", x_target, y);
end
