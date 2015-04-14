<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>

<html>
<head>
  <title>SocialBook.com - Manage Profiles</title>
</head>
<body bgcolor="#e0e0e0">
  <form runat="server">
  <table width="100%" cellpadding="2" bgcolor="#336699">
    <tr><td>
      <a href="SL.aspx?guide=false" style="text-decoration: none"><b><font size="30" face="Calibri" color="white">SocialBook</font></b>
      <img width="40" src="images\bubble.png" /></a>
      <font size="6" face="Calibri" color="white"><b>Create Profile</b></font>
    </td></tr>
  </table>
  <table width="100%" cellpadding="2" bgcolor="#996633">
    <tr>
      <td align="center" bgcolor="#A1B2C3">
        <a href="SL_Guide.aspx" style="text-decoration:none"><b><font size="3" face="Calibri" color="black">Guide</font></b></a>
      </td>
      <td align="center" bgcolor="#A1B2C3">
        <a href="SL_ManageProfiles.aspx" style="text-decoration:none"><b><font size="3" face="Calibri" color="black">Manage Profiles</font></b></a>
      </td>
      <td width="88%"></td>
    </tr>
    </table>
    <table id="Table1" width="100%" bgcolor="#BB8855" runat="server">
      <tr></tr>
  </table>
  <br />

  <center>
    <table border="0" cellpadding="2" runat="server">
      <tr>
        <td align="right">
          *First Name:
        </td>
        <td>
          <asp:TextBox ID="first" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="firstvalid" ControlToValidate="first" runat="server" Text="*field required"></asp:RequiredFieldValidator>
  
        </td>
      </tr>
      <tr>
        <td align="right">
          *Last Name:
        </td>
        <td>
          <asp:TextBox ID="last" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="lastvalid" ControlToValidate="last" runat="server" Text="*field required"></asp:RequiredFieldValidator>
  
        </td>
      </tr>
      <tr>
        <td align="right">
          *Birthdate:
        </td>
        <td>
          <asp:DropDownList ID="month" runat="server">
          <asp:ListItem Text="Month"    Value=""></asp:ListItem>
          <asp:ListItem Text="January"  Value="01"></asp:ListItem>
          <asp:ListItem Text="February" Value="02"></asp:ListItem>
          <asp:ListItem Text="March"    Value="03"></asp:ListItem>
          <asp:ListItem Text="April"    Value="04"></asp:ListItem>
          <asp:ListItem Text="May"      Value="05"></asp:ListItem>
          <asp:ListItem Text="June"     Value="06"></asp:ListItem>
          <asp:ListItem Text="July"     Value="07"></asp:ListItem>
          <asp:ListItem Text="August"   Value="08"></asp:ListItem>
          <asp:ListItem Text="September" Value="09"></asp:ListItem>
          <asp:ListItem Text="October"  Value="10"></asp:ListItem>
          <asp:ListItem Text="November" Value="11"></asp:ListItem>
          <asp:ListItem Text="December" Value="12"></asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ControlToValidate="month" runat="server" Text="*"></asp:RequiredFieldValidator>

          <asp:DropDownList ID="day" runat="server">
          <asp:ListItem Text="Day" Value = ""></asp:ListItem>
          <asp:ListItem Text="01" Value = "01"></asp:ListItem>
          <asp:ListItem Text="02" Value = "02"></asp:ListItem>
          <asp:ListItem Text="03" Value = "03"></asp:ListItem>
          <asp:ListItem Text="04" Value = "04"></asp:ListItem>
          <asp:ListItem Text="05" Value = "05"></asp:ListItem>
          <asp:ListItem Text="06" Value = "06"></asp:ListItem>
          <asp:ListItem Text="07" Value = "07"></asp:ListItem>
          <asp:ListItem Text="08" Value = "08"></asp:ListItem>
          <asp:ListItem Text="09" Value = "09"></asp:ListItem>
          <asp:ListItem Text="10" Value = "10"></asp:ListItem>
          <asp:ListItem Text="11" Value = "11"></asp:ListItem>
          <asp:ListItem Text="12" Value = "12"></asp:ListItem>
          <asp:ListItem Text="13" Value = "13"></asp:ListItem>
          <asp:ListItem Text="14" Value = "14"></asp:ListItem>
          <asp:ListItem Text="15" Value = "15"></asp:ListItem>
          <asp:ListItem Text="16" Value = "16"></asp:ListItem>
          <asp:ListItem Text="17" Value = "17"></asp:ListItem>
          <asp:ListItem Text="18" Value = "18"></asp:ListItem>
          <asp:ListItem Text="19" Value = "19"></asp:ListItem>
          <asp:ListItem Text="20" Value = "20"></asp:ListItem>
          <asp:ListItem Text="21" Value = "21"></asp:ListItem>
          <asp:ListItem Text="22" Value = "22"></asp:ListItem>
          <asp:ListItem Text="23" Value = "23"></asp:ListItem>
          <asp:ListItem Text="24" Value = "24"></asp:ListItem>
          <asp:ListItem Text="25" Value = "25"></asp:ListItem>
          <asp:ListItem Text="26" Value = "26"></asp:ListItem>
          <asp:ListItem Text="27" Value = "27"></asp:ListItem>
          <asp:ListItem Text="28" Value = "28"></asp:ListItem>
          <asp:ListItem Text="29" Value = "29"></asp:ListItem>
          <asp:ListItem Text="30" Value = "30"></asp:ListItem>
          <asp:ListItem Text="31" Value = "31"></asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ControlToValidate="day" runat="server" Text="*"></asp:RequiredFieldValidator>
          
          <asp:DropDownList ID="year" runat="server">
          <asp:ListItem Text="Year" Value=""></asp:ListItem>
          <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
          <asp:ListItem Text="1999" Value="1999"></asp:ListItem>
          <asp:ListItem Text="1998" Value="1998"></asp:ListItem>
          <asp:ListItem Text="1997" Value="1997"></asp:ListItem>
          <asp:ListItem Text="1996" Value="1996"></asp:ListItem>
          <asp:ListItem Text="1995" Value="1995"></asp:ListItem>
          <asp:ListItem Text="1994" Value="1994"></asp:ListItem>
          <asp:ListItem Text="1993" Value="1993"></asp:ListItem>
          <asp:ListItem Text="1992" Value="1992"></asp:ListItem>
          <asp:ListItem Text="1991" Value="1991"></asp:ListItem>
          <asp:ListItem Text="1990" Value="1990"></asp:ListItem>
          <asp:ListItem Text="1989" Value="1989"></asp:ListItem>
          <asp:ListItem Text="1988" Value="1988"></asp:ListItem>
          <asp:ListItem Text="1987" Value="1987"></asp:ListItem>
          <asp:ListItem Text="1986" Value="1986"></asp:ListItem>
          <asp:ListItem Text="1985" Value="1985"></asp:ListItem>
          <asp:ListItem Text="1984" Value="1984"></asp:ListItem>
          <asp:ListItem Text="1983" Value="1983"></asp:ListItem>
          <asp:ListItem Text="1982" Value="1982"></asp:ListItem>
          <asp:ListItem Text="1981" Value="1981"></asp:ListItem>
          <asp:ListItem Text="1980" Value="1980"></asp:ListItem>
          <asp:ListItem Text="1979" Value="1979"></asp:ListItem>
          <asp:ListItem Text="1978" Value="1978"></asp:ListItem>
          <asp:ListItem Text="1977" Value="1977"></asp:ListItem>
          <asp:ListItem Text="1976" Value="1976"></asp:ListItem>
          <asp:ListItem Text="1975" Value="1975"></asp:ListItem>
          <asp:ListItem Text="1974" Value="1974"></asp:ListItem>
          <asp:ListItem Text="1973" Value="1973"></asp:ListItem>
          <asp:ListItem Text="1972" Value="1972"></asp:ListItem>
          <asp:ListItem Text="1971" Value="1971"></asp:ListItem>
          <asp:ListItem Text="1970" Value="1970"></asp:ListItem>
          <asp:ListItem Text="1969" Value="1969"></asp:ListItem>
          <asp:ListItem Text="1968" Value="1968"></asp:ListItem>
          <asp:ListItem Text="1967" Value="1967"></asp:ListItem>
          <asp:ListItem Text="1966" Value="1966"></asp:ListItem>
          <asp:ListItem Text="1965" Value="1965"></asp:ListItem>
          <asp:ListItem Text="1964" Value="1964"></asp:ListItem>
          <asp:ListItem Text="1963" Value="1963"></asp:ListItem>
          <asp:ListItem Text="1962" Value="1962"></asp:ListItem>
          <asp:ListItem Text="1961" Value="1961"></asp:ListItem>
          <asp:ListItem Text="1960" Value="1960"></asp:ListItem>
          <asp:ListItem Text="1959" Value="1959"></asp:ListItem>
          <asp:ListItem Text="1958" Value="1958"></asp:ListItem>
          <asp:ListItem Text="1957" Value="1957"></asp:ListItem>
          <asp:ListItem Text="1956" Value="1956"></asp:ListItem>
          <asp:ListItem Text="1955" Value="1955"></asp:ListItem>
          <asp:ListItem Text="1954" Value="1954"></asp:ListItem>
          <asp:ListItem Text="1953" Value="1953"></asp:ListItem>
          <asp:ListItem Text="1952" Value="1952"></asp:ListItem>
          <asp:ListItem Text="1951" Value="1951"></asp:ListItem>
          <asp:ListItem Text="1950" Value="1950"></asp:ListItem>
          <asp:ListItem Text="1949" Value="1949"></asp:ListItem>
          <asp:ListItem Text="1948" Value="1948"></asp:ListItem>
          <asp:ListItem Text="1947" Value="1947"></asp:ListItem>
          <asp:ListItem Text="1946" Value="1946"></asp:ListItem>
          <asp:ListItem Text="1945" Value="1945"></asp:ListItem>
          <asp:ListItem Text="1944" Value="1944"></asp:ListItem>
          <asp:ListItem Text="1943" Value="1943"></asp:ListItem>
          <asp:ListItem Text="1942" Value="1942"></asp:ListItem>
          <asp:ListItem Text="1941" Value="1941"></asp:ListItem>
          <asp:ListItem Text="1940" Value="1940"></asp:ListItem>
          <asp:ListItem Text="1939" Value="1939"></asp:ListItem>
          <asp:ListItem Text="1938" Value="1938"></asp:ListItem>
          <asp:ListItem Text="1937" Value="1937"></asp:ListItem>
          <asp:ListItem Text="1936" Value="1936"></asp:ListItem>
          <asp:ListItem Text="1935" Value="1935"></asp:ListItem>
          <asp:ListItem Text="1934" Value="1934"></asp:ListItem>
          <asp:ListItem Text="1933" Value="1933"></asp:ListItem>
          <asp:ListItem Text="1932" Value="1932"></asp:ListItem>
          <asp:ListItem Text="1931" Value="1931"></asp:ListItem>
          <asp:ListItem Text="1930" Value="1930"></asp:ListItem>
          <asp:ListItem Text="1929" Value="1929"></asp:ListItem>
          <asp:ListItem Text="1928" Value="1928"></asp:ListItem>
          <asp:ListItem Text="1927" Value="1927"></asp:ListItem>
          <asp:ListItem Text="1926" Value="1926"></asp:ListItem>
          <asp:ListItem Text="1925" Value="1925"></asp:ListItem>
          <asp:ListItem Text="1924" Value="1924"></asp:ListItem>
          <asp:ListItem Text="1923" Value="1923"></asp:ListItem>
          <asp:ListItem Text="1922" Value="1922"></asp:ListItem>
          <asp:ListItem Text="1921" Value="1921"></asp:ListItem>
          <asp:ListItem Text="1920" Value="1920"></asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="yearvalid" ControlToValidate="year" runat="server" Text="*"></asp:RequiredFieldValidator>
  

        </td>
      </tr>
      <tr>
        <td align="right">
          Phone number:
        </td>
        <td>
          (<asp:TextBox ID="phone1" Width="30" MaxLength="3"  runat="server"></asp:TextBox>) 
          <asp:TextBox ID="phone2" Width="30" MaxLength="3" runat="server"></asp:TextBox>-
          <asp:TextBox ID="phone3" Width="40" MaxLength="4" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td align="right">
          Address:
        </td>
        <td>
          <asp:TextBox ID="address" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td align="right">
          City:
        </td>
        <td>
          <asp:TextBox ID="city" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td align="right">
          State:
        </td>
        <td>
        <asp:DropDownList ID="state" runat="server">
        <asp:ListItem Text="..." Value=""></asp:ListItem>
        <asp:ListItem Text="AL" Value="AL"></asp:ListItem>
        <asp:ListItem Text="AK" Value="AK"></asp:ListItem>
        <asp:ListItem Text="AZ" Value="AZ"></asp:ListItem>
        <asp:ListItem Text="AR" Value="AR"></asp:ListItem>
        <asp:ListItem Text="CA" Value="CA"></asp:ListItem>
        <asp:ListItem Text="CO" Value="CO"></asp:ListItem>
        <asp:ListItem Text="CT" Value="CT"></asp:ListItem>
        <asp:ListItem Text="DE" Value="DE"></asp:ListItem>
        <asp:ListItem Text="DC" Value="DC"></asp:ListItem>
        <asp:ListItem Text="FL" Value="FL"></asp:ListItem>
        <asp:ListItem Text="GA" Value="HI"></asp:ListItem>
        <asp:ListItem Text="GA" Value="HI"></asp:ListItem>
        <asp:ListItem Text="ID" Value="ID"></asp:ListItem>
        <asp:ListItem Text="IL" Value="IL"></asp:ListItem>
        <asp:ListItem Text="IN" Value="IN"></asp:ListItem>
        <asp:ListItem Text="IA" Value="IS"></asp:ListItem>
        <asp:ListItem Text="KS" Value="KS"></asp:ListItem>
        <asp:ListItem Text="KY" Value="KY"></asp:ListItem>
        <asp:ListItem Text="LA" Value="LA"></asp:ListItem>
        <asp:ListItem Text="ME" Value="ME"></asp:ListItem>
        <asp:ListItem Text="MD" Value="MD"></asp:ListItem>
        <asp:ListItem Text="MA" Value="MA"></asp:ListItem>
        <asp:ListItem Text="MI" Value="MI"></asp:ListItem>
        <asp:ListItem Text="MN" Value="MN"></asp:ListItem>
        <asp:ListItem Text="MS" Value="MS"></asp:ListItem>
        <asp:ListItem Text="MO" Value="MO"></asp:ListItem>
        <asp:ListItem Text="MT" Value="MT"></asp:ListItem>
        <asp:ListItem Text="NE" Value="NE"></asp:ListItem>
        <asp:ListItem Text="NV" Value="NV"></asp:ListItem>
        <asp:ListItem Text="NH" Value="NH"></asp:ListItem>
        <asp:ListItem Text="NJ" Value="NJ"></asp:ListItem>
        <asp:ListItem Text="NM" Value="NM"></asp:ListItem>
        <asp:ListItem Text="NY" Value="NY"></asp:ListItem>
        <asp:ListItem Text="NC" Value="NC"></asp:ListItem>
        <asp:ListItem Text="ND" Value="ND"></asp:ListItem>
        <asp:ListItem Text="OH" Value="OH"></asp:ListItem>
        <asp:ListItem Text="OK" Value="OK"></asp:ListItem>
        <asp:ListItem Text="OR" Value="OR"></asp:ListItem>
        <asp:ListItem Text="PA" Value="PA"></asp:ListItem>
        <asp:ListItem Text="RI" Value="RI"></asp:ListItem>
        <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
        <asp:ListItem Text="SD" Value="SD"></asp:ListItem>
        <asp:ListItem Text="TN" Value="TN"></asp:ListItem>
        <asp:ListItem Text="TX" Value="TX"></asp:ListItem>
        <asp:ListItem Text="UT" Value="UT"></asp:ListItem>
        <asp:ListItem Text="VT" Value="VT"></asp:ListItem>
        <asp:ListItem Text="VA" Value="VA"></asp:ListItem>
        <asp:ListItem Text="WA" Value="WA"></asp:ListItem>
        <asp:ListItem Text="WV" Value="WV"></asp:ListItem>
        <asp:ListItem Text="WI" Value="WI"></asp:ListItem>
        <asp:ListItem Text="WY" Value="WY"></asp:ListItem>
        </asp:DropDownList>		
        </td>
      </tr>
      <tr>
        <td align="right">
          Zipcode:
        </td>
        <td>
          <asp:TextBox ID="zipcode" Width="50" MaxLength="5" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td align="right">
          E-mail:
        </td>
        <td>
          <asp:TextBox ID="email" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td align="right">
          Facebook:
        </td>
        <td>
          <asp:TextBox ID="facebook" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td align="right">
          Twitter:
        </td>
        <td>
          <asp:TextBox ID="twitter" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
          Profile Image Path:
        </td>
        <td>
          <asp:TextBox ID="upload"  runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
        </td>
        <td>
          <font size="2">Note: Filename must be an image found in my 'dwk/images/' folder.</font>
        </td>
      </tr>
      <tr>
      <td></td><td><asp:Label ID="uploadlabel" runat="server" ForeColor="Red" /></td></tr>
      <tr>
        <td></td><td>
          <font color="red" size="2">* denotes a required field</font>
        </td>
      </tr>
    
    </table>
    <asp:Button Text="Save Profile" OnClick="onSave" runat="server" />
    <br />
    <asp:label id="output" runat="server" Text=""></asp:label>
    </center>
    
  </form>
  <table id="Table2" width="100%" runat="server">
    <tr>
      <td align="center">
        &copy Douglas Keller 2015
        <br />
        <font size="2">dwk24@zips.uakron.edu</font>
      </td>
    </tr>
  </table>
</body>
</html>

<script language="C#" runat="server">
  void Page_Load(Object sender, EventArgs e)
  {
    if (Request.QueryString["id"] == null)
    {
      Session["redir"] = "Invalid URL. You have been redirected.";
      Response.Redirect("SL.aspx?guide=false");
    }

      if (Request.QueryString["id"] != "new" && !IsPostBack)
      {
        try
        {
          string ConnectString =
              ConfigurationSettings.AppSettings["connectString"];
          MySqlDataAdapter adapter = new MySqlDataAdapter
             ("select * from users where id = " + Request.QueryString["id"], ConnectString);
          DataSet ds = new DataSet();
          adapter.Fill(ds);
          object[] values = ds.Tables[0].Rows[0].ItemArray;
          first.Text = (string)values[2];
          last.Text = (string)values[1];
          if (((string)values[3]).Length == 10)
          {
            month.SelectedValue = ((string)values[3]).Substring(0, 2);
            day.SelectedValue = ((string)values[3]).Substring(3, 2);
            year.SelectedValue = ((string)values[3]).Substring(6, 4);
          }
          if (((string)values[4]).Length == 12)
          {
            phone1.Text = ((string)values[4]).Substring(0, 3);
            phone2.Text = ((string)values[4]).Substring(4, 3);
            phone3.Text = ((string)values[4]).Substring(8, 4);
          }
          address.Text = (string)values[5];
          city.Text = (string)values[6];
          if (((string)values[7]).Length == 2)
          {
            state.SelectedValue = (string)values[7];
          }

          zipcode.Text = (string)values[8];
          facebook.Text = (string)values[9];
          twitter.Text = (string)values[10];
          email.Text = (string)values[11];
          upload.Text = (string)values[13];
      }
      catch (Exception)
      {
        Session["redir"] = "Invalid URL. You have been redirected.";
        Response.Redirect("SL.aspx?guide=false");
      }
    }
  }
  void onSave(Object sender, EventArgs e)
  {
    try
    {
      string dob = month.SelectedValue + "/" + day.SelectedValue + "/" + year.SelectedValue;
      string phone = phone1.Text + "-" + phone2.Text + "-" + phone3.Text;
      string addstr = address.Text;
      string citystr = city.Text;
      string statestr = state.SelectedValue;
      string zipstr = zipcode.Text;
      string fbstr = facebook.Text;
      string twstr = twitter.Text;
      string emstr = email.Text;


      if (dob.Length < 10)
        dob = "";
      if (phone.Length < 12)
        phone = "";

      // Load the image
      string imagename = upload.Text;
      string imagepath;
      if (imagename == "")
        imagename = "default.png";
      imagepath = @"C:\inetpub\wwwroot\WP_s2015\dwk24\images\" + imagename;

      FileStream fs;
      BinaryReader br;

      byte[] ImageData;
      fs = new FileStream(imagepath, FileMode.Open, FileAccess.Read);
      br = new BinaryReader(fs);
      ImageData = br.ReadBytes((int)fs.Length);
      br.Close();
      fs.Close();
      string imgstr = Convert.ToString(BitConverter.ToInt64(ImageData, 0), 2).PadLeft(64, '0');
      //  

      string query;
    
      if(Request.QueryString["id"] != "new") {
        query = "UPDATE users SET last='" + last.Text + "', first='" + first.Text + "', birthdate='" + dob + "', phone='" + phone
          + "', address='" + address.Text + "', city='" + city.Text + "', state='" + state.SelectedValue + "', "
              + "zipcode='" + zipcode.Text + "', facebook='" + facebook.Text + "', twitter='" + twitter.Text + "', email='" + email.Text
              + "', image='" + imgstr + "', imagename='" + imagename + "' WHERE id=" + Request.QueryString["id"];
      } else {
        query = "insert users (last, first, birthdate, phone, address, city, state, zipcode, facebook, twitter, email, image, imagename)"
              + " values ('" + last.Text + "', '" + first.Text + "', '" + dob + "', '" + phone
              + "', '" + address.Text + "', '" + city.Text + "', '" + state.SelectedValue + "', '" + zipcode.Text
              + "', '" + facebook.Text + "', '" + twitter.Text + "', '" + email.Text + "', '" + imgstr + "', '" + imagename + "')";
      }


      MySqlConnection connection = new MySqlConnection();
      connection.ConnectionString = ConfigurationSettings.AppSettings["connectString"];

      MySqlCommand cmd = new MySqlCommand(query, connection);

      connection.Open();
      cmd.ExecuteNonQuery();
      connection.Close();
      Session["editid"] = 0;
      Response.Redirect("SL_ManageProfiles.aspx");
    }
    catch (Exception df)
    {
      output.Text = df.ToString();// "Unable to create or update profile. Please try again later.";
    }
  }

</script>