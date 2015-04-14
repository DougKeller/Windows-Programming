<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>

<html>

<head>
  <title>SocialBook - View Profile</title>
</head>
<body bgcolor="#e0e0e0">
  <form id="Form1" runat="server">
  <table width="100%" cellpadding="2" bgcolor="#336699">
    <tr><td>
      <a href="SL.aspx?guide=false" style="text-decoration: none"><b><font size="30" face="Calibri" color="white">SocialBook</font></b>
      <img width="40" src="images\bubble.png" /></a>
      <font size="6" face="Calibri" color="white"><b>View Profile</b></font>
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
    <table width="100%" bgcolor="#BB8855" runat="server">
      <tr></tr>
  </table>
  <br />
  <asp:Button ID="return" Text="<- Return" OnClick="onReturn" runat="server" />
  <br />
  <table id="header" align="left" borderwidth="1" bordercolor="#cccccc" width="30%" bgcolor="white" runat="server">
    <tr>
      <td bgcolor="#4477AA" align="center" >
        <asp:Label ID="username" Font-Size="30" Font-Names="Calibri" Font-Bold="true" ForeColor="White" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="center">
        <a id="link" runat="server"><img id="image" alt="Profile Image" height="245" runat="server" /></a>
      </td>
    </tr>
  </table>
  <table id="data" bgcolor="white" cellpadding="4" borderwidth="1" bordercolor="#cccccc" runat="server">
    <tr>
      <td align="right">
        Birthdate:
      </td>
      <td>
        <asp:Label ID="dob" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="right">
        Phone #:
      </td>
      <td>
        <asp:Label ID="phone" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="right">
        Address: 
      </td>
      <td>
        <asp:Label ID="address" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="right">
        City:
      </td>
      <td>
        <asp:Label ID="city" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="right">
        State:
      </td>
      <td>
        <asp:Label ID="state" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="right">
        Zipcode:
      </td>
      <td>
        <asp:Label ID="zipcode" runat="server" />
      </td>
    </tr>
    <tr>
      <td align="right">
        Facebook:
      </td>
      <td>
        <a id="facebook" runat="server" >View profile</a>
      </td>
    </tr>
    <tr>
      <td align="right">
        Twitter:
      </td>
      <td>
        <a id="twitter" class="twitter-mention-button" runat="server" />
        <script>
          !function (d, s, id) 
          {
            var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
            if (!d.getElementById(id)) 
            {
              js = d.createElement(s);
              js.id = id;
              js.src = p + '://platform.twitter.com/widgets.js';
              fjs.parentNode.insertBefore(js, fjs);
            }
          }

          (document, 'script', 'twitter-wjs');
        </script>
      </td>
    </tr>
    <tr>
      <td align="right">
        E-mail:
      </td>
      <td>
        <a id="email" runat="server" />
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <asp:Button Text="Edit Profile" runat="server" OnClick="onEdit" />
      </td>
    </tr>
  </table>
      
  
      <asp:Label ID="output" runat="server" />
  </form>
  <table width="100%" runat="server">
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
  void Page_Load(object sender, EventArgs e)
  {
    if (Request.QueryString["id"] != null)
    {
      link.HRef = "SL_ViewImage.aspx?id=" + Request.QueryString["id"];

      try
      {
        string ConnectString =
            ConfigurationSettings.AppSettings["connectString"];
        MySqlDataAdapter adapter = new MySqlDataAdapter
           ("select * from users where id = " + Request.QueryString["id"], ConnectString);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        object[] values = ds.Tables[0].Rows[0].ItemArray;

        username.Text = (string)values[2] + " " + (string)values[1];
        dob.Text = (string)values[3];
        phone.Text = (string)values[4];
        address.Text = (string)values[5];
        city.Text = (string)values[6];
        state.Text = (string)values[7];
        zipcode.Text = (string)values[8];
        if (((string)values[9]).Length == 0)
          facebook.Visible = false;
        else
        {
          facebook.HRef = (string)values[9];
        }
        if (((string)values[10]).Length == 0)
          twitter.Visible = false;
        else
        {
          twitter.HRef = @"https://twitter.com/intent/tweet?screen_name=" + (string)values[10];
        }
        if (((string)values[11]).Length == 0)
          email.Visible = false;
        else
        {
          email.HRef = "mailto:" + (string)values[11];
          email.InnerText = (string)values[11];
        }

        image.Src = @"images\" + (string)values[13];
        if (image.Width > 300)
          image.Width = 300;
      }
      catch (Exception)
      {
        Session["redir"] = "Invalid URL. You have been redirected.";
        Response.Redirect("SL.aspx?guide=false");
      }
    }
    else
    {
      Session["redir"] = "Invalid URL. You have been redirected.";
      Response.Redirect("SL.aspx?guide=false");
    }
  }

  void onEdit(Object sender, EventArgs e)
  {
    Response.Redirect("SL_CreateProfile.aspx?id=" + Request.QueryString["id"]);
  }
  void onReturn(Object sender, EventArgs e)
  {
    Response.Redirect("SL.aspx?guide=false");
  }
</script>