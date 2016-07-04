<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="SetStateTime.aspx.cs" Inherits="UserInterface.Administrator.SetStateTime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Editar tiempo un estado</h1>
    </div>
    <br />

    <div class="form-group">
        <label class="control-label col-sm-2">Estados:</label>
        <div class="col-sm-3">
            <asp:DropDownList ID="ddlState" runat="server"  class="form-control">
            </asp:DropDownList>
        </div>
    </div>
    <br />
    <br />
    <div class="form-group">
        <label class="control-label col-sm-2">Duración en minutos:</label>
        <div class="col-sm-3">
            <asp:TextBox ID="txtTiempo" runat="server" class="form-control" type="number" min="0" max="60"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTiempo" ErrorMessage="Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />

    

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnEditTime" runat="server" Text="Editar" class="btn btn-success" OnClick="btnEditTime_Click" />
        </div>
    </div>

</asp:Content>
