function nonLinearSystemMenu()
    while true
        fprintf("\n--- System of Non-linear Equations ---\n");
        fprintf("1- Two Equations\n");
        fprintf("2- Three Equations\n");
        fprintf("3- Four Equations\n");
        fprintf("0- Back\n");

        c = input("Your choice: ");

        if c == 0
            return;
        end

        switch c
            case 1
                NonLinearSystem2();
            case 2
                NonLinearSystem3();
            case 3
                NonLinearSystem4();
            otherwise
                fprintf("Invalid input.\n");
        end
    end
end
