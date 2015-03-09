<%@ Page Inherits="LanderSRCPage" Src="LanderSRC.cs" %>

<html>
  <body>
    <h1>dwk24 - Complex Calculator, part B</h1>
    <form runat="server">
      <hr>
      <table cellpadding="2">
        <tr>	
          <td>Number 1:</td>
          <td><asp:TextBox ID="at1" RunAt="Server" /></td>
          <td>+</td>
          <td><asp:TextBox ID="bt1" RunAt="Server" /></td>
          <td>i</td>
        </tr>
        <tr>	
          <td>Number 2:</td>
          <td><asp:TextBox ID="at2" RunAt="Server" /></td>
          <td>+</td>
          <td><asp:TextBox ID="bt2" RunAt="Server" /></td>
          <td>i</td>
        </tr>
        </table>
        <br />
      <asp:Button ID="Button1" Text="+" OnClick="OnAdd" RunAt="Server" />
      <asp:Button ID="Button2" Text="-" OnClick="OnSub" RunAt="Server" />
      <asp:Button ID="Button3" Text="*" OnClick="OnMul" RunAt="Server" />
      <asp:Button ID="Button4" Text="/" OnClick="OnDiv" RunAt="Server" />
      <td> <asp:Label ID="Output" Text="0+0i" RunAt="server" /></td>
      <br><br>
      <hr>
    </form>
  </body>
</html>