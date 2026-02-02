function GaussQuad4()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        m = @(t) (b+a)/2 + ((b-a)/2) * t;
        i = ((b-a)/2)*(((18+sqrt(30))/36)*f(m(sqrt(3/7-(2/7)*sqrt(6/5))))+((18+sqrt(30))/36)*f(m(-sqrt(3/7-(2/7)*sqrt(6/5)))));
        i = i + ((b-a)/2)*(((18-sqrt(30))/36)*f(m(sqrt(3/7+(2/7)*sqrt(6/5))))+((18-sqrt(30))/36)*f(m(-sqrt(3/7+(2/7)*sqrt(6/5)))));
        fprintf("The integral of %s from %f to %f using four points Gauss Quadrature = %.12f\n", funcStr,a, b, i);
end