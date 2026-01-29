function SOR()
        fprintf("Put your equations in the form f(x, y, ...) = 0\n");
        while true
            q = input("Enter the number of equations: ");
            if q > 0 && mod(q, 1) == 0
                break;
            end
            fprintf("You must enter a positve integer.\n");
        end
        coef = zeros(q,q+1);
        for i = 1:q
            fprintf("Enter the %i equation [a0 a1 a2 ..... an : bn]\n", i);
            coef(i, :) = input("");
        end

        guess = zeros(q, 1);
        guess(:, 1) = input("Enter the initial guess [x0 y0 z0 ....]: ");

        omega = input("Enter omega: ");

        A = coef(:,1:q);
        b = coef(:,q+1);
    
        rows = 1:q;
        success = false;
    
        permsRows = perms(rows);
    
        for k = 1:size(permsRows,1)
            Ap = A(permsRows(k,:), :);
            bp = b(permsRows(k,:), :);
    
            isDD = true;
            for i = 1:q
                if abs(Ap(i,i)) <= sum(abs(Ap(i,:))) - abs(Ap(i,i))
                    isDD = false;
                    break;
                end
            end
    
            if isDD
                A = Ap;
                b = bp;
                success = true;
                break;
            end
        end
    
        if ~success
            warning("System is NOT diagonally dominant. SOR may not converge.");
            return;
        end
    
        coef = [A b];

        for n = 1:2
            for i = 1:q
                s = coef(i, q+1);
                for j = 1:q
                    if i ~=j 
                        s = s - coef(i, j) * guess(j, 1);
                    end
                end
                guess(i, 1) = (s * omega) / coef(i, i) + (1 - omega) * guess(i, 1);
            end
        end

        fprintf("The Solution of these equations is: \n");
        disp(guess);
end