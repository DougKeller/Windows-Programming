// Douglas Keller
// dwk24@zips.uakron.edu
// Assignment 3 Part D

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

public class CalcStudioPage : Page
{
    Assembly assem = Assembly.LoadFrom("C:/inetpub/wwwroot/WP_s2015/dwk24/CStudio/bin/calc.dll");
    protected void constructCalc(object sender, EventArgs e)
    {
        CheckBox adds = (CheckBox)Form.FindControl("addSimpleCalc"),
            subs = (CheckBox)Form.FindControl("subtractSimpleCalc"),
            muls = (CheckBox)Form.FindControl("multiplySimpleCalc"),
            divs = (CheckBox)Form.FindControl("divideSimpleCalc"),
            addc = (CheckBox)Form.FindControl("addComplexCalc"),
            subc = (CheckBox)Form.FindControl("subtractComplexCalc"),
            mulc = (CheckBox)Form.FindControl("multiplyComplexCalc"),
            divc = (CheckBox)Form.FindControl("divideComplexCalc");

        List<String> simpleOps = new List<String>(),
            complexOps = new List<String>();

        if (adds.Checked)
            simpleOps.Add("+");
        if (subs.Checked)
            simpleOps.Add("-");
        if (muls.Checked)
            simpleOps.Add("*");
        if (divs.Checked)
            simpleOps.Add("/");
        if (addc.Checked)
            complexOps.Add("+");
        if (subc.Checked)
            complexOps.Add("-");
        if (mulc.Checked)
            complexOps.Add("*");
        if (divc.Checked)
            complexOps.Add("/");

        if (simpleOps.Count != 0) // Add simple calculator if 1+ operations were selected
        {
            HtmlTable table = new HtmlTable(); // Create a table for the simple calculator
            table.ID = "SimpleCalculator";
            table.Border = 1;

            Label label = new Label();
            HtmlTableCell cell = new HtmlTableCell();
            cell.ColSpan = 2;
            HtmlTableRow row = new HtmlTableRow();
            TextBox textbox = new TextBox();

            label.Text = "Simple Calculator";

            cell.Controls.Add(label);   // Add "Simple Calculator" to the table's first row
            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell();      // Reset cells, rows, labels
            row = new HtmlTableRow();
            label = new Label();

            label.Text = "Number 1  ";    // Values for second table row
            textbox.ID = "simpA";

            cell.Controls.Add(label);   // Add second row values
            row.Controls.Add(cell);
            cell = new HtmlTableCell();
            cell.Controls.Add(textbox);
            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell();      // Reset cell and row variables
            row = new HtmlTableRow();
            textbox = new TextBox();
            label = new Label();

            label.Text = "Number 2  ";    // Values for third table row
            textbox.ID = "simpB";

            cell.Controls.Add(label);   // Add third row values
            row.Controls.Add(cell);
            cell = new HtmlTableCell();
            cell.Controls.Add(textbox);
            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell(); // Reset values
            row = new HtmlTableRow();
            label = new Label();

            cell.ColSpan = 2;
            cell.Align = "center";

            Button button;

            if (adds.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "SimpAdd";
                button.Text = "+";
                button.Click += simpAdd_Click;
                cell.Controls.Add(button);
            }
            if (subs.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "SimpSub";
                button.Text = "-";
                button.Click += simpSub_Click;
                cell.Controls.Add(button);
            }
            if (muls.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "SimpMul";
                button.Text = "*";
                button.Click += simpMul_Click;
                cell.Controls.Add(button);
            }
            if (divs.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "SimpDiv";
                button.Text = "/";
                button.Click += simpDiv_Click;
                cell.Controls.Add(button);
            }

            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell();
            row = new HtmlTableRow();
            label = new Label();

            label.Text = "Result";      // Add last row values

            cell.Controls.Add(label);
            row.Controls.Add(cell);

            cell = new HtmlTableCell();
            label = new Label();

            label.Text = "";
            label.ID = "SimpleOutput";

            cell.Controls.Add(label);   // Add the output label to the last row
            row.Controls.Add(cell);
            table.Controls.Add(row);    // Add the row to the table

            table.Visible = true;
            Form.Controls.Add(table);   // Add the simple calculator to Form  
        }
        if (complexOps.Count != 0)
        {
            HtmlTable table = new HtmlTable(); // Create a table for the simple calculator
            table.ID = "complexCalculator";
            table.Border = 1;

            Label label = new Label();
            HtmlTableCell cell = new HtmlTableCell();
            cell.ColSpan = 2;
            HtmlTableRow row = new HtmlTableRow();
            TextBox textbox = new TextBox();
            TextBox textbox2 = new TextBox();

            label.Text = "Complex Calculator";

            cell.Controls.Add(label);   // Add "Complex Calculator" to the table's first row
            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell();      // Reset cells, rows, labels
            row = new HtmlTableRow();
            label = new Label();

            label.Text = "Number 1";    // Values for second table row
            textbox.ID = "compA1";
            textbox2.ID = "compB1";

            cell.Controls.Add(label);   // Add second row values
            row.Controls.Add(cell);
            cell = new HtmlTableCell();
            cell.Controls.Add(textbox);
            label = new Label();
            label.Text = "+";
            cell.Controls.Add(label);
            cell.Controls.Add(textbox2);
            label = new Label();
            label.Text = "i";
            cell.Controls.Add(label);
            row.Controls.Add(cell);

            table.Controls.Add(row);

            cell = new HtmlTableCell();      // Reset cell and row variables
            row = new HtmlTableRow();
            textbox = new TextBox();
            textbox2 = new TextBox();
            label = new Label();

            label.Text = "Number 2";    // Values for third table row
            textbox.ID = "compA2";
            textbox2.ID = "compB2";

            cell.Controls.Add(label);   // Add third row values
            row.Controls.Add(cell);
            cell = new HtmlTableCell();
            cell.Controls.Add(textbox);
            label = new Label();
            label.Text = "+";
            cell.Controls.Add(label);
            cell.Controls.Add(textbox2);
            label = new Label();
            label.Text = "i";
            cell.Controls.Add(label);
            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell();
            cell.Align = "center";
            cell.ColSpan = 3;
            row = new HtmlTableRow();
            label = new Label();

            Button button;

            if (addc.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "CompAdd";
                button.Text = "+";
                button.Click += compAdd_Click;
                cell.Controls.Add(button);
            }
            if (subc.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "CompSub";
                button.Text = "-";
                button.Click += compSub_Click;
                cell.Controls.Add(button);
            }
            if (mulc.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "CompMul";
                button.Text = "*";
                button.Click += compMul_Click;
                cell.Controls.Add(button);
            }
            if (divc.Checked)
            {
                button = new Button(); // Create a button for the operation
                button.ID = "CompDiv";
                button.Text = "/";
                button.Click += compDiv_Click;
                cell.Controls.Add(button);
            }

            row.Controls.Add(cell);
            table.Controls.Add(row);

            cell = new HtmlTableCell();
            row = new HtmlTableRow();
            label = new Label();

            label.Text = "Result";      // Add last row values

            cell.Controls.Add(label);
            row.Controls.Add(cell);

            cell = new HtmlTableCell();
            label = new Label();

            label.Text = "";
            label.ID = "ComplexOutput";

            cell.Controls.Add(label);   // Add the output label to the last row
            row.Controls.Add(cell);
            table.Controls.Add(row);    // Add the row to the table

            table.Visible = true;
            Form.Controls.Add(table);   // Add the simple calculator to Form  
        }
    }

    void simpAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("SimpleOutput");
            output.Text = "";
            TextBox atext = (TextBox)Form.FindControl("simpA");
            TextBox btext = (TextBox)Form.FindControl("simpB");

            double a = Convert.ToDouble(atext.Text);
            double b = Convert.ToDouble(btext.Text);

            Type type = assem.GetType("calc.SimpleCalc");
            MethodInfo method = type.GetMethod("add");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { a, b });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void simpSub_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("SimpleOutput");
            TextBox atext = (TextBox)Form.FindControl("simpA");
            TextBox btext = (TextBox)Form.FindControl("simpB");

            double a = Convert.ToDouble(atext.Text);
            double b = Convert.ToDouble(btext.Text);

            Type type = assem.GetType("calc.SimpleCalc");
            MethodInfo method = type.GetMethod("subtract");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { a, b });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void simpMul_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("SimpleOutput");
            TextBox atext = (TextBox)Form.FindControl("simpA");
            TextBox btext = (TextBox)Form.FindControl("simpB");

            double a = Convert.ToDouble(atext.Text);
            double b = Convert.ToDouble(btext.Text);

            Type type = assem.GetType("calc.SimpleCalc");
            MethodInfo method = type.GetMethod("multiply");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { a, b });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void simpDiv_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("SimpleOutput");
            TextBox atext = (TextBox)Form.FindControl("simpA");
            TextBox btext = (TextBox)Form.FindControl("simpB");

            double a = Convert.ToDouble(atext.Text);
            double b = Convert.ToDouble(btext.Text);

            Type type = assem.GetType("calc.SimpleCalc");
            MethodInfo method = type.GetMethod("divide");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { a, b });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void compAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("ComplexOutput");
            TextBox a1text = (TextBox)Form.FindControl("compA1");
            TextBox b1text = (TextBox)Form.FindControl("compB1");
            TextBox a2text = (TextBox)Form.FindControl("compA2");
            TextBox b2text = (TextBox)Form.FindControl("compB2");

            double a1 = Convert.ToDouble(a1text.Text);
            double b1 = Convert.ToDouble(b1text.Text);
            double a2 = Convert.ToDouble(a2text.Text);
            double b2 = Convert.ToDouble(b2text.Text);

            Type numtype = assem.GetType("calc.ComplexNum");
            Object arg1 = Activator.CreateInstance(numtype, new object[] { a1, b1 });
            Object arg2 = Activator.CreateInstance(numtype, new object[] { a2, b2 });

            Type type = assem.GetType("calc.ComplexCalc");
            MethodInfo method = type.GetMethod("add");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { arg1, arg2 });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void compSub_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("ComplexOutput");
            TextBox a1text = (TextBox)Form.FindControl("compA1");
            TextBox b1text = (TextBox)Form.FindControl("compB1");
            TextBox a2text = (TextBox)Form.FindControl("compA2");
            TextBox b2text = (TextBox)Form.FindControl("compB2");

            double a1 = Convert.ToDouble(a1text.Text);
            double b1 = Convert.ToDouble(b1text.Text);
            double a2 = Convert.ToDouble(a2text.Text);
            double b2 = Convert.ToDouble(b2text.Text);

            Type numtype = assem.GetType("calc.ComplexNum");
            Object arg1 = Activator.CreateInstance(numtype, new object[] { a1, b1 });
            Object arg2 = Activator.CreateInstance(numtype, new object[] { a2, b2 });

            Type type = assem.GetType("calc.ComplexCalc");
            MethodInfo method = type.GetMethod("subtract");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { arg1, arg2 });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void compMul_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("ComplexOutput");
            TextBox a1text = (TextBox)Form.FindControl("compA1");
            TextBox b1text = (TextBox)Form.FindControl("compB1");
            TextBox a2text = (TextBox)Form.FindControl("compA2");
            TextBox b2text = (TextBox)Form.FindControl("compB2");

            double a1 = Convert.ToDouble(a1text.Text);
            double b1 = Convert.ToDouble(b1text.Text);
            double a2 = Convert.ToDouble(a2text.Text);
            double b2 = Convert.ToDouble(b2text.Text);

            Type numtype = assem.GetType("calc.ComplexNum");
            Object arg1 = Activator.CreateInstance(numtype, new object[] { a1, b1 });
            Object arg2 = Activator.CreateInstance(numtype, new object[] { a2, b2 });

            Type type = assem.GetType("calc.ComplexCalc");
            MethodInfo method = type.GetMethod("multiply");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { arg1, arg2 });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }
    void compDiv_Click(object sender, EventArgs e)
    {
        try
        {
            Label output = (Label)Form.FindControl("ComplexOutput");
            TextBox a1text = (TextBox)Form.FindControl("compA1");
            TextBox b1text = (TextBox)Form.FindControl("compB1");
            TextBox a2text = (TextBox)Form.FindControl("compA2");
            TextBox b2text = (TextBox)Form.FindControl("compB2");

            double a1 = Convert.ToDouble(a1text.Text);
            double b1 = Convert.ToDouble(b1text.Text);
            double a2 = Convert.ToDouble(a2text.Text);
            double b2 = Convert.ToDouble(b2text.Text);

            Type numtype = assem.GetType("calc.ComplexNum");
            Object arg1 = Activator.CreateInstance(numtype, new object[] { a1, b1 });
            Object arg2 = Activator.CreateInstance(numtype, new object[] { a2, b2 });

            Type type = assem.GetType("calc.ComplexCalc");
            MethodInfo method = type.GetMethod("divide");
            Object o = Activator.CreateInstance(type);
            object result = method.Invoke(o, new object[] { arg1, arg2 });

            output.Text = result.ToString();
        }
        catch (Exception) { }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            HtmlTable table = new HtmlTable();
            table.Border = 1;
            table.Align = "left";

            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();

            foreach (Type type in assem.GetTypes())
            {

                if (type.Name.Contains("Calc"))
                {
                    Label label = new Label();
                    label.ID = type.Name + "Label";
                    label.Text = type.Name + " Methods";

                    cell.Controls.Add(label);
                    row.Controls.Add(cell);
                    table.Controls.Add(row);

                    row = new HtmlTableRow();
                    cell = new HtmlTableCell();
                    label = new Label();

                    row = new HtmlTableRow();
                    cell = new HtmlTableCell();

                    foreach (MethodInfo method in type.GetMethods())
                    {
                        if (method.Name.Contains("add") || method.Name.Contains("subtract") || method.Name.Contains("multiply") || method.Name.Contains("divide"))
                        {
                            row = new HtmlTableRow();
                            cell = new HtmlTableCell();

                            label = new Label();
                            label.Text = method.Name;

                            CheckBox box = new CheckBox();

                            box.ID = method.Name + type.Name;
                            cell.Controls.Add(box);
                            cell.Controls.Add(label);
                            row.Controls.Add(cell);
                            table.Controls.Add(row);

                            row = new HtmlTableRow();
                            cell = new HtmlTableCell();
                        }
                    }
                }
            }
            Button button = new Button();
            button.ID = "ConstructButton";
            button.Text = "Construct!";
            button.Width = 155;

            cell.Controls.Add(button);
            row.Controls.Add(cell);
            table.Controls.Add(row);
            table.Visible = true;
            Form.Controls.Add(table);
        }
        catch (Exception)
        { }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        constructCalc(sender, e);
    }
}