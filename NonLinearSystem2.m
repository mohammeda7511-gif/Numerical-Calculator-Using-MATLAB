function NonLinearSystem2()
        syms x y
        fprintf("Put your equations on the form f(x, y) = 0\nEnter ONLY f(x, y)\n");
        funcStr1 = input("Enter the first equation: ", 's');
        funcStr2 = input("Enter the second equation: ", 's');

        f_sym = str2sym(funcStr1);
        g_sym = str2sym(funcStr2);

        df_dx = diff(f_sym, x);
        df_dy = diff(f_sym, y);
        dg_dx = diff(g_sym, x);
        dg_dy = diff(g_sym, y);

        f = matlabFunction(f_sym, 'Vars', [x y]);
        g = matlabFunction(g_sym, 'Vars', [x y]);
    
        df_dx_fun = matlabFunction(df_dx, 'Vars', [x y]);
        df_dy_fun = matlabFunction(df_dy, 'Vars', [x y]);
        dg_dx_fun = matlabFunction(dg_dx, 'Vars', [x y]);
        dg_dy_fun = matlabFunction(dg_dy, 'Vars', [x y]);

        while true  
        X0 = input("Enter the initial guess [x0; y0]: ");
        if size(X0,1) == 2 && size(X0,2) == 1
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

        for k = 1:2
                J = [ df_dx_fun(X0(1),X0(2))   df_dy_fun(X0(1),X0(2));
                      dg_dx_fun(X0(1),X0(2))   dg_dy_fun(X0(1),X0(2)) ];

                F = [ f(X0(1),X0(2));
                      g(X0(1),X0(2)) ];

                X1 = X0 - J \ F;
                X0 = X1;
        end

        fprintf("Solution after %i iterations:\n", m);
        fprintf("x = %.12f, y = %.12f\n", X1(1), X1(2));
end
