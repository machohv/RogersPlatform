<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="UserInterface.Administrator.AdminOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Administración de pedidos</h1>
    </div>
    <br />

    <br />
    <br />
    <div class="table-responsive">

    <asp:GridView ID="grdPedidos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered bs-table"
        AllowSorting="true" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField DataField="FULLNAME" HeaderText="Nombre Completo" ItemStyle-Width="90px" >
<ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DATETTIME" HeaderText="Fecha" ItemStyle-Width="200px" >

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="ORDERID" HeaderText="Estado" ItemStyle-Width="200px" >

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            


            

        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
