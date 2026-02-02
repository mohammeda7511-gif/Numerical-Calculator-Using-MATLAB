function Romberg4()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        n = zeros(2);
        h = zeros(2);
        integ = zeros(2);
        n(1) = 10000;
        n(2) = 5000;
        for k = 1:2
                    h(k) = (b-a)/n(k);
        middleSum = 0;
        for i = 1:n(k)-1
            middleSum = middleSum + f(a + i * h(k));
        end
        integ(k) = (h(k)/2)*(f(a)+2*middleSum+f(b));
        end
        i = (4/3)*integ(1)-(1/3)*integ(2);
        fprintf("The integral of %s from %f to %f of order h^4 = %.12f\n", funcStr, a, b, i);
end