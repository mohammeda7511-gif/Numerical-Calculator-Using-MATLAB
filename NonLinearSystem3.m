function NonLinearSystem3()
        syms x y z
        fprintf("Put your equations on the form f(x, y, z) = 0\nEnter ONLY f(x, y, z)\n");
        funcStr1 = input("Enter the first equation: ", 's');
        funcStr2 = input("Enter the second equation: ", 's');
        funcStr3 = input("Enter the third equation: ", 's');

        f_sym = str2sym(funcStr1);
        g_sym = str2sym(funcStr2);
        h_sym = str2sym(funcStr3);

        df_dx = diff(f_sym, x);
        df_dy = diff(f_sym, y);
        df_dz = diff(f_sym, z);

        dg_dx = diff(g_sym, x);
        dg_dy = diff(g_sym, y);
        dg_dz = diff(g_sym, z);

        dh_dx = diff(h_sym, x);
        dh_dy = diff(h_sym, y);
        dh_dz = diff(h_sym, z);

        f = matlabFunction(f_sym, 'Vars', [x y z]);
        g = matlabFunction(g_sym, 'Vars', [x y z]);
        h = matlabFunction(h_sym, 'Vars', [x y z]);

        df_dx_fun = matlabFunction(df_dx, 'Vars', [x y z]);
        df_dy_fun = matlabFunction(df_dy, 'Vars', [x y z]);
        df_dz_fun = matlabFunction(df_dz, 'Vars', [x y z]);

        dg_dx_fun = matlabFunction(dg_dx, 'Vars', [x y z]);
        dg_dy_fun = matlabFunction(dg_dy, 'Vars', [x y z]);
        dg_dz_fun = matlabFunction(dg_dz, 'Vars', [x y z]);

        dh_dx_fun = matlabFunction(dh_dx, 'Vars', [x y z]);
        dh_dy_fun = matlabFunction(dh_dy, 'Vars', [x y z]);
        dh_dz_fun = matlabFunction(dh_dz, 'Vars', [x y z]);

        while true  
        X0 = input("Enter the initial guess [x0; y0; z0]: ");
        if size(X0,1) == 3 && size(X0,2) == 1
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

        for k = 1:m
                J = [ df_dx_fun(X0(1),X0(2),X0(3))   df_dy_fun(X0(1),X0(2),X0(3))   df_dz_fun(X0(1),X0(2),X0(3));
                      dg_dx_fun(X0(1),X0(2),X0(3))   dg_dy_fun(X0(1),X0(2),X0(3))   dg_dz_fun(X0(1),X0(2),X0(3));
                      dh_dx_fun(X0(1),X0(2),X0(3))   dh_dy_fun(X0(1),X0(2),X0(3))   dh_dz_fun(X0(1),X0(2),X0(3)) ];

                F = [ f(X0(1),X0(2),X0(3));
                      g(X0(1),X0(2),X0(3));
                      h(X0(1),X0(2),X0(3)) ];

                X1 = X0 - J \ F;
                X0 = X1;
        end

        fprintf("Solution after %i iterations:\n", m);
        fprintf("x = %.12f\n", X1(1));
        fprintf("y = %.12f\n", X1(2));
        fprintf("z = %.12f\n", X1(3));
end
