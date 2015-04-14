<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>

<html>
<head>
  <title>SocialBook.com - View Image</title>
</head>
<body bgcolor="#e0e0e0">
  <form runat="server">
  <table width="100%" cellpadding="2" bgcolor="#336699">
    <tr><td>
      <a href="SL.aspx?guide=false" style="text-decoration: none"><b><font size="30" face="Calibri" color="white">SocialBook</font></b>
      <img width="40" src="images\bubble.png" /></a>
      <font size="6" face="Calibri" color="white"><b>View Image</b></font>
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

  <asp:Button Text="<- Return" onClick="onReturn" runat="server" />
  <br />
  <a id="link" runat="server"><img style="float:left" id="image" alt="Image" runat="server" /></a>
  <asp:Label ID="output" runat="server" />
  
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
  void Page_Load (Object sender, EventArgs e)
  {
    if (Request.QueryString["id"] != null)
    {
      link.HRef = "SL_ViewProfile.aspx?id=" + Request.QueryString["id"];

      try
      {
        string ConnectString =
          ConfigurationSettings.AppSettings["connectString"];
        MySqlDataAdapter adapter = new MySqlDataAdapter
           ("select * from users where id = " + Request.QueryString["id"], ConnectString);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        object[] values = ds.Tables[0].Rows[0].ItemArray;


        image.Src = @"images\" + (string)values[13];
      }
      catch (Exception d)
      {
        Session["redir"] = "Invalid URL. You have been redirected.";
        Response.Redirect("SL.aspx?guide=false");
      }
    }
    else
    {

      Session["redir"] = "Your session has expired. You have been redirected.";
      Response.Redirect("SL.aspx");
    }
  }

  void onReturn(Object sender, EventArgs e)
  {
    Response.Redirect("SL_ViewProfile.aspx?id=" + Request.QueryString["id"]);
  }
</script>