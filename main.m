clc
clear

    fprintf("\n========== Welcome To The Numerical Methods Calculator ==========\n");
while true
    fprintf("1- Interpolation\n");
    fprintf("2- System of Linear Equations\n");
    fprintf("3- Differentiation\n");
    fprintf("4- Integration\n");
    fprintf("5- Eigen Pairs\n");
    fprintf("6- System of Non-linear Equations\n");
    fprintf("7- Root of Non-linear Equation\n");
    fprintf("8- Runge-Kutta ODE Solver\n");
    fprintf("0- Exit\n");

    choice = input("Your choice: ");

    if choice == 0
        fprintf("Exiting program... Goodbye!\n");
        break;
    end

    switch choice
        case 1
            interpolationMenu();
        case 2
            linearSystemMenu();
        case 3
            differentiationMenu();
        case 4
            integrationMenu();
        case 5
            PowerMethod();
        case 6
            nonLinearSystemMenu();
        case 7
            NonLinearEqn();
        case 8
            RungeKutta();
        otherwise
            fprintf("Invalid choice, please try again.\n");
    end
end