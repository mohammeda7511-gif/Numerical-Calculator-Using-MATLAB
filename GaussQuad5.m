function GaussQuad5()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        m = @(t) (b+a)/2 + ((b-a)/2) * t;
        i = ((b-a)/2)*(((322-13*sqrt(70))/900)*f(m((1/3)*sqrt(5+2*sqrt(10/7))))+((322-13*sqrt(70))/900)*f(m(-(1/3)*sqrt(5+2*sqrt(10/7)))));
        i = i + ((b-a)/2)*(((322+13*sqrt(70))/900)*f(m((1/3)*sqrt(5-2*sqrt(10/7))))+((322+13*sqrt(70))/900)*f(m(-(1/3)*sqrt(5-2*sqrt(10/7)))));
        i = i + ((b-a)/2)*((128/225)*f(m(0)));
        fprintf("The integral of %s from %f to %f using five points Gauss Quadrature = %.12f\n", funcStr,a, b, i);
end