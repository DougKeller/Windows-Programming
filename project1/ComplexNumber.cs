using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace calc
{
    public class ComplexNumber
    {
        public double first;
        public double second;

        public ComplexNumber()
        {
            first = second = 0;
        }

        public ComplexNumber(double f, double s)
        {
            first = f;
            second = s;
        }

        public ComplexNumber conjugate()
        {
            return new ComplexNumber(first, -second);
        }
    }
}
