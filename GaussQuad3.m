function GaussQuad3()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        m = @(t) (b+a)/2 + ((b-a)/2) * t;
        i = ((b-a)/2)*((5/9)*(f(m(sqrt(0.6)))+f(m(-sqrt(0.6))))+(8/9)*f(m(0)));
        fprintf("The integral of %s from %f to %f using three points Gauss Quadrature = %.12f\n", funcStr,a, b, i);
end