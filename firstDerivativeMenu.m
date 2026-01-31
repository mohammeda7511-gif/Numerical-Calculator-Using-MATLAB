function firstDerivativeMenu()
    while true
        fprintf("\nFirst Derivative Methods:\n");
        fprintf("1- Forward Difference\n");
        fprintf("2- Central Difference (Most Accurate)\n");
        fprintf("3- Backward Difference\n");
        fprintf("0- Back\n");

        c = input("Your choice: ");

        if c == 0
            return;
        end

        switch c
            case 1
                firstForwardDiff();
            case 2
                firstCentralDiff();
            case 3
                firstBackwardDiff();
            otherwise
                fprintf("Invalid input.\n");
        end
    end
end
