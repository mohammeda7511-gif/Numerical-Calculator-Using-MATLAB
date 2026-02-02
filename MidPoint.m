function MidPoint()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the lower limit: ");
        b = input("Enter the upper limit: ");
        i = (b-a)*f((b+a)/2);
        fprintf("The value of the integral of f(x) from %f to %f is: %.12f\n", b, a, i);
end