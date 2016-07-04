<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="UserInterface.Administrator.EditEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Agregar empleado</h1>
    </div>
    <br />

    
    <div class="form-group">
        <label class="control-label col-sm-2" for="txtNombre">Nombre Completo:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="txtUsername">Nombre de Usuario:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Usuario"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUsername" ErrorMessage="Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="txtPassword">Contraseña:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Contraseña" type="password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Puesto:</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlJob" runat="server" Width="200px" class="form-control">
                <asp:ListItem Text="Cocinero" Value="false"></asp:ListItem>
                <asp:ListItem Text="Administrador" Value="true"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <br />

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">

            <asp:Button ID="btnEditEmployee" runat="server" Text="Editar" class="btn btn-success" OnClick="btnEditEmployee_Click"/>
        </div>
    </div>
</asp:Content>
