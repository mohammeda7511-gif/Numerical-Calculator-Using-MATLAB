function GaussQuad2()
        funcStr = input("Enter the function: ", 's');
        f = str2func(['@(x)' funcStr]);
        a = input("Enter the value of the lower limit: ");
        b = input("Enter the value of the upper limit: ");
        i = ((b-a)/2)*(1*f((b+a)/2+((b-a)/2)*(1/sqrt(3)))+1*f((b+a)/2+((b-a)/2)*(-1/sqrt(3))));
        fprintf("The integral of %s from %f to %f using two points Gauss Quadrature = %.12f\n", funcStr,a, b, i);
end