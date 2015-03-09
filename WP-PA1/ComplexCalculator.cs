using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace calc
{
    public class ComplexCalculator
    {
        public ComplexNumber add(ComplexNumber a, ComplexNumber b)
        {
            return new ComplexNumber(a.first + b.first, a.second + b.second);
        }

        public ComplexNumber subtract(ComplexNumber a, ComplexNumber b)
        {
            return new ComplexNumber(a.first - b.first, a.second - b.second);
        }

        public ComplexNumber multiply(ComplexNumber a, ComplexNumber b)
        {
            double first = a.first * b.first - a.second * b.second;
            double second = a.first * b.second + a.second * b.first;

            return new ComplexNumber(first, second);
        }

        public ComplexNumber divide(ComplexNumber a, ComplexNumber b)
        {
            ComplexNumber num = multiply(a, b.conjugate());
            ComplexNumber den = multiply(b, b.conjugate());

            return new ComplexNumber(num.first / den.first, num.second / den.first);
        }
    }
}
