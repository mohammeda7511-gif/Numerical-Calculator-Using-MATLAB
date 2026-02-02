function trap()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        n = 10000;
        h = (b-a)/n;
        middleSum = 0;
        for i = 1:n-1
            middleSum = middleSum + f(a + i * h);
        end
        integ = (h/2)*(f(a)+2*middleSum+f(b));
        fprintf("The integral of %s from %f to %f is equal to %f\n", funcStr, a, b, integ);
end