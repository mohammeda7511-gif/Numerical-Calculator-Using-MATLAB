function gaussQuadratureMenu()
    while true
        fprintf("\nGauss Quadrature:\n");
        fprintf("1- Two Points\n");
        fprintf("2- Three Points\n");
        fprintf("3- Four Points\n");
        fprintf("4- Five Points\n");
        fprintf("0- Back\n");

        c = input("Your choice: ");

        if c == 0
            return;
        end

        switch c
            case 1
                GaussQuad2();
            case 2
                GaussQuad3();
            case 3
                GaussQuad4();
            case 4
                GaussQuad5();
            otherwise
                fprintf("Invalid input.\n");
        end
    end
end
