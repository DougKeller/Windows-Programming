// Douglas Keller
// dwk24@zips.uakron.edu
// Windows Programming
// Assignment 3

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class LanderSRCPage : Page
{
    protected Label Output;
    protected TextBox at1, bt1, at2, bt2;

    public void OnAdd(Object sender, EventArgs e)
    {
        ComplexNum a = getNum(at1, bt1);
        ComplexNum b = getNum(at2, bt2);
        ComplexCalc calc = new ComplexCalc();

        ComplexNum result = calc.add(a, b);
        Output.Text = String.Format("({0}) + ({1}) = {2}", a.ToString(), b.ToString(), result.ToString());
    }

    public void OnSub(Object sender, EventArgs e)
    {
        ComplexNum a = getNum(at1, bt1);
        ComplexNum b = getNum(at2, bt2);
        ComplexCalc calc = new ComplexCalc();

        ComplexNum result = calc.subtract(a, b);
        Output.Text = String.Format("({0}) - ({1}) = {2}", a.ToString(), b.ToString(), result.ToString());
    }

    public void OnMul(Object sender, EventArgs e)
    {
        ComplexNum a = getNum(at1, bt1);
        ComplexNum b = getNum(at2, bt2);
        ComplexCalc calc = new ComplexCalc();

        ComplexNum result = calc.multiply(a, b);
        Output.Text = String.Format("({0}) * ({1}) = {2}", a.ToString(), b.ToString(), result.ToString());
    }

    public void OnDiv(Object sender, EventArgs e)
    {
        ComplexNum a = getNum(at1, bt1);
        ComplexNum b = getNum(at2, bt2);
        ComplexCalc calc = new ComplexCalc();

        ComplexNum result = calc.divide(a, b);
        Output.Text = String.Format("({0}) / ({1}) = {2}", a.ToString(), b.ToString(), result.ToString());
    }

    public ComplexNum getNum(TextBox y, TextBox z)
    {
        try
        {
            double a = Convert.ToDouble(y.Text);
            double b = Convert.ToDouble(z.Text);

            return new ComplexNum(a, b);
        }
        catch (Exception)
        {
            Output.Text = "Invalid input";
            return new ComplexNum();
        }
    }
}

public class ComplexNum
{
    public double a, b;

    public ComplexNum()
    {
        a = b = 0;
    }

    public ComplexNum(double f, double s)
    {
        a = f;
        b = s;
    }

    // Returns a ComplexNum with value a-bi.
    public ComplexNum complexConjugate()
    {
        return new ComplexNum(a, -b);
    }

    // Returns a string in the format a+bi.
    public override string ToString()
    {
        string s;

        if (a != 0)
        {
            s = "" + a;

            if (b > 0)
                if (b == 1)
                    s += "+i";
                else
                    s += "+" + b + "i";
            else if (b < 0)
                if (b == -1)
                    s += "-i";
                else
                    s += "" + b + "i";
        }
        else
        {
            if (b == 0)
                s = "0";
            else if (b == 1)
                s = "i";
            else if (b == -1)
                s = "-i";
            else
                s = "" + b + 'i';
        }

        return s;
    }
}

public class ComplexCalc
{

    // Adds a and b values of two complex nums.
    public ComplexNum add(ComplexNum a, ComplexNum b)
    {
        return new ComplexNum(a.a + b.a, a.b + b.b);
    }

    // Subtracts a and b values of two complex nums.
    public ComplexNum subtract(ComplexNum a, ComplexNum b)
    {
        return new ComplexNum(a.a - b.a, a.b - b.b);
    }

    // FOILs two ComplexNums to calculate the product.
    public ComplexNum multiply(ComplexNum a, ComplexNum b)
    {
        double first = a.a * b.a - a.b * b.b;
        double second = a.a * b.b + a.b * b.a;

        return new ComplexNum(first, second);
    }

    // Multiplies both numbers by the denominator's complex conjugate to find the quotient.
    public ComplexNum divide(ComplexNum a, ComplexNum b)
    {
        ComplexNum num = multiply(a, b.complexConjugate());
        ComplexNum den = multiply(b, b.complexConjugate());

        return new ComplexNum(num.a / den.a, num.b / den.a);
    }
}