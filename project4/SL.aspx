<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>

<html>
<head>
  <title>SocialBook.com</title>
</head>
<body bgcolor="#e0e0e0">
  <form runat="server">
  <table width="100%" cellpadding="2" bgcolor="#336699">
    <tr><td>
      <a href="SL.aspx?guide=false" style="text-decoration: none"><b><font size="30" face="Calibri" color="white">SocialBook</font></b>
      <img width="40" src="images\bubble.png" /></a>
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
    <asp:Label id="output" ForeColor="red" runat="server" />
    <asp:DataGrid ID="Grid" CellPadding="2" AutoGenerateColumns="false"
          BackColor="White" Width="40%" OnItemCommand="onItemCommand" 
          GridLines="None" BorderWidth="1" BorderColor="#cccccc"
          runat="server">
          <HeaderStyle BackColor="#336699" ForeColor="white"
            Font-Bold="true" />
          <ItemStyle BackColor="white" ForeColor="black" />
          <AlternatingItemStyle BackColor="#eeeeee"
            ForeColor="black" />
          <Columns>
            <asp:BoundColumn Visible="false" DataField="id" />
            <asp:BoundColumn HeaderText="Name" DataField="first" />
            <asp:BoundColumn DataField="last" />
            <asp:BoundColumn HeaderText="Location" DataField="city" />
            <asp:ButtonColumn text="view profile" CommandName="view" />
          </Columns>
    </asp:DataGrid>
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
  void Page_Load (Object sender, EventArgs e)
  {
      if (Request.QueryString["guide"] == null)
        Response.Redirect("SL_Guide.aspx");
      if (!IsPostBack) {
          string ConnectString =
              ConfigurationSettings.AppSettings["connectString"];
          MySqlDataAdapter adapter = new MySqlDataAdapter
             ("select * from users", ConnectString);
          DataSet ds = new DataSet ();
          adapter.Fill (ds);
          Grid.DataSource = ds;
          Grid.DataBind ();

          output.Text = (string)Session["redir"];
          Session["redir"] = null;
      }
  }
  void onItemCommand(Object sender, DataGridCommandEventArgs e)
  {
    if (e.CommandName == "view")
    {
      Response.Redirect("SL_ViewProfile.aspx?id=" + e.Item.Cells[0].Text);
    }
  }

</script>