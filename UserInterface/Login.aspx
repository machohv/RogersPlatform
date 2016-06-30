<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UserInterface.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roger's</title>
    <link rel="icon" href="images/favicon.ico" sizes="16x16"/>
    <link href="Content/login.css" rel="stylesheet" />
</head>
<body>    
    <div class="login-page">
        <div class="form">
            <form class="login-form" id="form1" runat="server">
                <img src="images/13509491_10153725799861989_1475246789_o.png" />
             &nbsp;      
                <br />
            <asp:TextBox ID="txtUser" runat="server" placeholder="Usuario"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Debe digitar un usuario" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="El usuario no corresponde a un empleado" ForeColor="Red" OnServerValidate="UserValidate" ControlToValidate="txtUser" Display="Dynamic" ></asp:CustomValidator>
                <br />
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Contraseña" type="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Debe digitar una contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="La contraseña es incorrecta" ForeColor="Red" OnServerValidate="PasswordValidate" ControlToValidate="txtPassword" Display="Dynamic"></asp:CustomValidator>
                <br />
            <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" />
                <br />
            </form>
  </div>
</div>
</body>
</html>
