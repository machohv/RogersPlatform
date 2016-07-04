<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="AdminEmployees.aspx.cs" Inherits="UserInterface.Administrator.AdminEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Administración de empleados</h1>
    </div>
    <br />

    <div class="row">
        <div class="col-lg-6">
            <div class="input-group custom-search-form">
                <asp:TextBox ID="txtBuscar" runat="server" placeholder="Buscar..." class="form-control"></asp:TextBox>
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="btnBuscar" runat="server" onserverclick="search">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </div>

        <div class="col-lg-2"></div>
        <div class="col-lg-4">
            <a class="btn btn-success" href="AddEmployee.aspx"><i class="fa fa-plus"></i> Agregar Empleado</a>
        </div>
        
    </div>

    <br />
    <br />
    <div class="table-responsive">

    <asp:GridView ID="grdPlatos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered bs-table">
        <Columns>
            <asp:BoundField DataField="FULLNAME" HeaderText="Nombre Completo" ItemStyle-Width="90px" >
<ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="USERNAME" HeaderText="Nombre de usuario" ItemStyle-Width="200px" >

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Administrador" ItemStyle-Width="60px" >
                <ItemTemplate>
                      <%# (bool)(Eval("isADMIN")) ? "Administrador" : "Cocinero"%>
                </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Editar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <a class="btn btn-default btn-sm" href="EditEmployee.aspx?employeeID=<%#Eval("PERSON_ID")%>"><i class="fa fa-pencil-square-o"></i> Editar</a>
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Eliminar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <a class="btn btn-danger btn-sm" href="RemoveEmployee.aspx?employeeID=<%#Eval("PERSON_ID")%>"><i class="fa fa-trash"></i> Eliminar</a>
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>
            

        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
