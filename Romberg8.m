function Romberg8()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        n = zeros(4);
        h = zeros(4);
        integ = zeros(4);
        n(1) = 10000;
        n(2) = 5000;
        n(3) = 2500;
        n(4) = 1250;
        for k = 1:4
                    h(k) = (b-a)/n(k);
        middleSum = 0;
        for i = 1:n(k)-1
            middleSum = middleSum + f(a + i * h(k));
        end
        integ(k) = (h(k)/2)*(f(a)+2*middleSum+f(b));
        end
        i = (64/63)*((16/15)*((4/3)*integ(1)-(1/3)*integ(2))-(1/15)*((4/3)*integ(2)-(1/3)*integ(3)))-(1/63)*((16/15)*((4/3)*integ(2)-(1/3)*integ(3))-(1/15)*((4/3)*integ(3)-(1/3)*integ(4)));
        fprintf("The integral of %s from %f to %f of order h^8 = %.12f\n", funcStr, a, b, i);
end