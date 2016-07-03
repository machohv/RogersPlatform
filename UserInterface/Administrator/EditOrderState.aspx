<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="EditOrderState.aspx.cs" Inherits="UserInterface.Administrator.EditOrderState" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Editar estado</h1>
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

    <div class="row">
        <div class="col-lg-3">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-default btn-sm" OnClick="btnCancelar_Click"/>
        </div>
        <div class="col-lg-3">
            <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-success btn-sm" OnClick="btnEditar_Click" Width="91px"/>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
