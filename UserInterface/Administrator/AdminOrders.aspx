<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="UserInterface.Administrator.AdminOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Administración de pedidos</h1>
    </div>
    <br />

    <div class="row">
        <div class="col-lg-3">
            <label class="control-label" for="txtNombre">Nombre Completo:</label>
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre..." class=" form-control"></asp:TextBox>
        </div>
        <div class="col-lg-3">
            <label class="control-label" for="txtFechaInicio">Fecha Inicial:</label>
            <asp:TextBox ID="txtFechaInicio" runat="server" placeholder="Fecha Inicio..." class=" form-control" type="date"></asp:TextBox>
            <br />
            <label class="control-label" for="txtFechaFin">Fecha Final:</label>
            <asp:TextBox ID="txtFechaFin" runat="server" placeholder="Fecha Fin..." class=" form-control" type="date"></asp:TextBox>
        </div>
        <div class="col-lg-3">
            <label class="control-label" for="ddlEstado">Estado:</label>
            <asp:DropDownList ID="ddlEstado" runat="server" Width="200px" class="form-control">
            </asp:DropDownList>

        </div>
        <div class="col-lg-3">
            <br />
            <button class="btn btn-primary btn-lg" type="button" id="btnBuscarNombre" runat="server" onserverclick="search" >
                <i class="fa fa-search"></i> Buscar
            </button>
        </div>
    </div>

    <br />

    <div class="table-responsive">

    <asp:GridView ID="grdPedidos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered bs-table" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>

            <asp:TemplateField HeaderText="Nombre Completo">
                
                <ItemTemplate>
                    <%#Eval("FULLNAME")%>
                </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
            </asp:TemplateField>

                

            <asp:TemplateField HeaderText="Fecha">
               
                <ItemTemplate>
                    <%#Eval("DATETTIME")%>
                </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
            </asp:TemplateField>
            

            <asp:TemplateField HeaderText="Estado">
                
                <ItemTemplate>
                    <%# getState(Eval("ORDERSTATEID").ToString())%>

                </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Editar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <a class="btn btn-default btn-sm" href="EditOrderState.aspx?OrderId=<%#Eval("ORDERID")%>"><i class="fa fa-pencil-square-o"></i> Editar</a>
                </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
            </asp:TemplateField>

            

        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#2a2a2a" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>


    </div>
</asp:Content>
