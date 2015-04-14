<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Page Language="C#" Debug="true" %>

<html>
<head>
  <title>SocialBook - Guide</title>
</head>
<body bgcolor="#e0e0e0">
  <form id="Form1" runat="server">
  <table width="100%" cellpadding="2" bgcolor="#336699">
    <tr><td>
      <a href="SL.aspx?guide=false" style="text-decoration: none"><b><font size="30" face="Calibri" color="white">SocialBook</font></b>
      <img width="40" src="images\bubble.png" /></a>
      <font size="6" face="Calibri" color="white"><b>Guide</b></font>
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
  </form>

  <center>
  <font face="Calibri" size="30" color="#222222"><b>How to Navigate</b></font>
  <br />
  <font face="Calibri" size="5" color="#222222"><b>This Website</b></font>
  <hr />
  
  <table width="70%" runat="server">
    <tr>
      <td align="center">
        <a href="SL.aspx?guide=false" runat="server">Click here to get started</a>
      </td>
    </tr>
  <tr>
    <td align="center">
      <h1>Overview</h1>
    </td>
  </tr>
  <tr>
    <td>
  <p>
    At the top of every page, you will see a description of the page you're on, as well as two buttons. 
    Clicking "SocialBook" on any page will redirect you to the homepage. "Guide" will redirect you to this page,
    and "Manage Profiles" will redirect you to a page where you can create, modify, or delete an existing profile.
    <br /><br />
    This site uses the Request's query string to identify which user profile to share, edit, etc.
    <br /><br />
    The following sections will give a description of every page:
  </p>
  </td>
  </tr>
  <tr>
    <td align="center">
      <h2>SL.aspx</h2>
    </td>
  </tr>
  <tr>
    <td>
      <p>
        SL.aspx is the homepage. Here, you can view a summary of all current records and click on a link to view a specific profile.
        <br /><br />
        If the url does not contain a Query value for "guide", then this page will redirect you to SL_Guide.aspx upon loading.
      </p>
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <h2>SL_ManageProfiles.aspx</h2>
    </td>
  </tr>
  <tr>
    <td>
      <p>
        This page displays a table of all profiles with small bits of information, including the id number in the left-most column.
        Here, you have three options: you may view, create, edit, or delete a profile. Viewing, editting, and deleting a profile
        can be done through that profile's respective row. To create a new profile, simply click the button below the datatable.
      </p>
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <h2>SL_CreateProfile.aspx</h2>
    </td>
  </tr>
  <tr>
    <td>
      <p>
        The Create Profile page is responsible for creating new accounts and editting existing ones. If you select the  
        "edit" option from the Manage Profiles page, this page will load with the profile's current information already
        filled in. This is performed by setting an 'editid' value in the current Session when you click edit. When this
        page loads, it checks to see if that 'editid' has a value and if it does, it loads all the information for that profile.
        <br /><br />
        Right now, you can only set the imagepath to a file that already exists in my /images/ folder.
        <br /><br />
        The page will not allow you to create the profile unless you specify a name and birthdate for the user.
      </p>
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <h2>SL_ViewProfile.aspx</h2>
    </td>
  </tr>
  <tr>
    <td>
      <p>
        When the view option is selected on any page, the id of the profile to view is saved in the Session's 'viewid' variable.
        Upon loading this page, it will load the profile corresponding to the given id. If no id is set, you will be redirected
        to the homepage.
        <br /><br />
        On this page, you can see all the user's information, including the profile picture. If a facebook or twitter account is
        specified for this account, the respective elements are added to the profile's table. Facebook does not provide a plugin
        to allow direct-access to a personal profile, so I was unable to embed anything that would allow you to comment or interact
        with the user's Facebook profile. However, the Twitter widget does work. If a username is specified, you may click the
        widget to send the user a tweet.
        <br /><br />
        If you click the profile picture, you will be directed to the View Image page. You may click the "return" button to return
        to the homepage. Finally, there is a button at the bottom of the table labelled "Edit Profile", which allows you to edit
        the current profile without having to go to the Manage Profiles page first.
      </p>
      <br />
    </td>
  </tr>
  <tr>
    <td align="center">
      <h2>SL_ViewImage.aspx</h2>
    </td>
  </tr>
  <tr>
    <td>
      <p>
        Finally, this page is used for viewing the full-sized version of a profile picture. Clicking the image or the "return"
        button will redirect you to the user's profile. If no image is specified, this page will redirect you to the homepage
        instead.  
      </p>
      <br />
    </td>
  </tr>

  </table>
    &copy Douglas Keller 2015
    <br />
    <font size="2">dwk24@zips.uakron.edu</font>
  </center>
</body>
</html>
