function linearSystemMenu()
    while true
        fprintf("\n--- System of Linear Equations ---\n");
        fprintf("1- Gauss Seidel\n");
        fprintf("2- Successive Over Relaxation (SOR)\n");
        fprintf("0- Back\n");

        c = input("Your choice: ");

        if c == 0
            return;
        end

        switch c
            case 1
                GaussSeidel();
            case 2
                SOR();
            otherwise
                fprintf("Invalid input.\n");
        end
    end
end
