function interpolationMenu()
    while true
        fprintf("\n--- Interpolation ---\n");
        fprintf("1- Newton Divided Difference\n");
        fprintf("2- Lagrange Interpolation\n");
        fprintf("0- Back\n");

        c = input("Your choice: ");

        if c == 0
            return;
        end

        switch c
            case 1
                NDividedDiff();
            case 2
                Lagrange();
            otherwise
                fprintf("Invalid input.\n");
        end
    end
end
