<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>

<html>
<head>
  <title>SocialBook.com - Manage Profiles</title>
</head>
<body bgcolor="#e0e0e0">
  <form id="Form1" runat="server">
  <table width="100%" cellpadding="2" bgcolor="#336699">
    <tr><td>
      <a href="SL.aspx?guide=false" style="text-decoration: none"><b><font size="30" face="Calibri" color="white">SocialBook</font></b>
      <img width="40" src="images\bubble.png" /></a>
      <font size="6" face="Calibri" color="white"><b>Manage Profiles</b></font>
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
    <asp:DataGrid ID="Grid" CellPadding="2" AutoGenerateColumns="false"
          BackColor="White" Width="60%" OnItemCommand="onItemCommand" 
          GridLines="None" BorderWidth="1" BorderColor="#cccccc"
          runat="server">
          <HeaderStyle BackColor="#336699" ForeColor="white"
            Font-Bold="true" />
          <ItemStyle BackColor="white" ForeColor="black" />
          <AlternatingItemStyle BackColor="#eeeeee"
            ForeColor="black" />
          <Columns>
            <asp:BoundColumn HeaderText="ID" DataField="id" />
            <asp:BoundColumn HeaderText="Name" DataField="first" />
            <asp:BoundColumn DataField="last" />
            <asp:BoundColumn HeaderText="Location" DataField="city" />
            <asp:BoundColumn HeaderText="Phone" DataField="phone" />
            <asp:ButtonColumn text="view" CommandName="view" />
            <asp:ButtonColumn text="edit" CommandName="edit" />
            <asp:ButtonColumn text="delete" CommandName="delete" />
          </Columns>
    </asp:DataGrid>
    <asp:Button Text="Add new profile" OnClick="onAddProfile" runat="server" />
    <asp:Label ID="output" runat="server" />
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
      if (!IsPostBack) {
          string ConnectString =
              ConfigurationSettings.AppSettings["connectString"];
          MySqlDataAdapter adapter = new MySqlDataAdapter
             ("select * from users", ConnectString);
          DataSet ds = new DataSet ();
          adapter.Fill (ds);
          Grid.DataSource = ds;
          Grid.DataBind ();
      }
  }
  void onItemCommand(Object sender, DataGridCommandEventArgs e)
  {

    if (e.CommandName == "edit")
    {
      Response.Redirect("SL_CreateProfile.aspx?id=" + e.Item.Cells[0].Text);
    }
    else if (e.CommandName == "delete") 
    {
      string query = @"delete from users where id='" + Convert.ToInt32(e.Item.Cells[0].Text) + @"'"; 
      
      MySqlConnection connection = new MySqlConnection();
      connection.ConnectionString = ConfigurationSettings.AppSettings["connectString"];
      MySqlCommand cmd = new MySqlCommand(query, connection);

      try
      {
        connection.Open();
        cmd.ExecuteNonQuery();
        connection.Close();
        Response.Redirect("SL_ManageProfiles.aspx");
      }
      catch (Exception)
      {
        output.Text = "Unable to delete. Please try again later.";
      }
      
    } else if (e.CommandName == "view")
    {
      Response.Redirect("SL_ViewProfile.aspx?id=" + e.Item.Cells[0].Text);
    }
  }
  void onAddProfile(Object sender, EventArgs e)
  {
      Response.Redirect("SL_CreateProfile.aspx?id=new");
  }

</script>