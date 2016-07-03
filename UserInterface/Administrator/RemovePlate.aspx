<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="RemovePlate.aspx.cs" Inherits="UserInterface.Administrator.RemovePlate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Eliminar platillo</h1>
    </div>
    <br />
    <div class="row">
        <p>¿Está seguro que desea eliminar el platillo <%=Nombre%> del menú?</p>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-default btn-sm" OnClick="btnCancelar_Click"/>
        </div>
        <div class="col-lg-3">
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" class="btn btn-danger btn-sm" OnClick="btnEliminar_Click"/>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
