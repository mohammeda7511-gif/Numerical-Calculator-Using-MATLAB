function NonLinearSystem4()
        syms x y z w
        fprintf("Put your equations on the form f(x, y, z, w) = 0\nEnter ONLY f(x, y, z, w)\n");
        funcStr1 = input("Enter the first equation: ", 's');
        funcStr2 = input("Enter the second equation: ", 's');
        funcStr3 = input("Enter the third equation: ", 's');
        funcStr4 = input("Enter the fourth equation: ", 's');

        f_sym = str2sym(funcStr1);
        g_sym = str2sym(funcStr2);
        h_sym = str2sym(funcStr3);
        k_sym = str2sym(funcStr4);

        df_dx = diff(f_sym, x);
        df_dy = diff(f_sym, y);
        df_dz = diff(f_sym, z);
        df_dw = diff(f_sym, w);

        dg_dx = diff(g_sym, x);
        dg_dy = diff(g_sym, y);
        dg_dz = diff(g_sym, z);
        dg_dw = diff(g_sym, w);

        dh_dx = diff(h_sym, x);
        dh_dy = diff(h_sym, y);
        dh_dz = diff(h_sym, z);
        dh_dw = diff(h_sym, w);

        dk_dx = diff(k_sym, x);
        dk_dy = diff(k_sym, y);
        dk_dz = diff(k_sym, z);
        dk_dw = diff(k_sym, w);

        f = matlabFunction(f_sym, 'Vars', [x y z w]);
        g = matlabFunction(g_sym, 'Vars', [x y z w]);
        h = matlabFunction(h_sym, 'Vars', [x y z w]);
        kf = matlabFunction(k_sym, 'Vars', [x y z w]);

        df_dx_fun = matlabFunction(df_dx, 'Vars', [x y z w]);
        df_dy_fun = matlabFunction(df_dy, 'Vars', [x y z w]);
        df_dz_fun = matlabFunction(df_dz, 'Vars', [x y z w]);
        df_dw_fun = matlabFunction(df_dw, 'Vars', [x y z w]);

        dg_dx_fun = matlabFunction(dg_dx, 'Vars', [x y z w]);
        dg_dy_fun = matlabFunction(dg_dy, 'Vars', [x y z w]);
        dg_dz_fun = matlabFunction(dg_dz, 'Vars', [x y z w]);
        dg_dw_fun = matlabFunction(dg_dw, 'Vars', [x y z w]);

        dh_dx_fun = matlabFunction(dh_dx, 'Vars', [x y z w]);
        dh_dy_fun = matlabFunction(dh_dy, 'Vars', [x y z w]);
        dh_dz_fun = matlabFunction(dh_dz, 'Vars', [x y z w]);
        dh_dw_fun = matlabFunction(dh_dw, 'Vars', [x y z w]);

        dk_dx_fun = matlabFunction(dk_dx, 'Vars', [x y z w]);
        dk_dy_fun = matlabFunction(dk_dy, 'Vars', [x y z w]);
        dk_dz_fun = matlabFunction(dk_dz, 'Vars', [x y z w]);
        dk_dw_fun = matlabFunction(dk_dw, 'Vars', [x y z w]);

        while true  
        X0 = input("Enter the initial guess [x0; y0; z0; t0]: ");
        if size(X0,1) == 4 && size(X0,2) == 1
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
                J = [ df_dx_fun(X0(1),X0(2),X0(3),X0(4))   df_dy_fun(X0(1),X0(2),X0(3),X0(4))   df_dz_fun(X0(1),X0(2),X0(3),X0(4))   df_dw_fun(X0(1),X0(2),X0(3),X0(4));
                      dg_dx_fun(X0(1),X0(2),X0(3),X0(4))   dg_dy_fun(X0(1),X0(2),X0(3),X0(4))   dg_dz_fun(X0(1),X0(2),X0(3),X0(4))   dg_dw_fun(X0(1),X0(2),X0(3),X0(4));
                      dh_dx_fun(X0(1),X0(2),X0(3),X0(4))   dh_dy_fun(X0(1),X0(2),X0(3),X0(4))   dh_dz_fun(X0(1),X0(2),X0(3),X0(4))   dh_dw_fun(X0(1),X0(2),X0(3),X0(4));
                      dk_dx_fun(X0(1),X0(2),X0(3),X0(4))   dk_dy_fun(X0(1),X0(2),X0(3),X0(4))   dk_dz_fun(X0(1),X0(2),X0(3),X0(4))   dk_dw_fun(X0(1),X0(2),X0(3),X0(4)) ];

                F = [ f(X0(1),X0(2),X0(3),X0(4));
                      g(X0(1),X0(2),X0(3),X0(4));
                      h(X0(1),X0(2),X0(3),X0(4));
                      kf(X0(1),X0(2),X0(3),X0(4)) ];

                X1 = X0 - J \ F;
                X0 = X1;
        end

        fprintf("Solution after %i iterations:\n", m);
        fprintf("x = %.12f\n", X1(1));
        fprintf("y = %.12f\n", X1(2));
        fprintf("z = %.12f\n", X1(3));
        fprintf("w = %.12f\n", X1(4));
end
