function Simpson()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the lower limit: ");
        b = input("Enter the upper limit: ");
        n = 10000;

        h = (b-a)/n;
        q = f(a)+f(b);
        sumo = 0;
        for i = 1:2:n-1
            sumo = sumo + 4*f(a+i*h);
        end
        sume = 0;
        for j = 2:2:n-2
            sume = sume + 2*f(a+j*h);
        end
        i = (h/3)*(q+sumo+sume);
        fprintf("The value of the integral of f(x) from %f to %f is: %.12f\n", a, b, i);
end