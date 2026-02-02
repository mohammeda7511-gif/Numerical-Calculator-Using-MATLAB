function rombergMenu()
    while true
        fprintf("\nRomberg Integration:\n");
        fprintf("1- O(h^4)\n");
        fprintf("2- O(h^6)\n");
        fprintf("3- O(h^8)\n");
        fprintf("0- Back\n");

        c = input("Your choice: ");

        if c == 0
            return;
        end

        switch c
            case 1
                Romberg4();
            case 2
                Romberg6();
            case 3
                Romberg8();
            otherwise
                fprintf("Invalid input.\n");
        end
    end
end
