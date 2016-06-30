<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="AdminPlates.aspx.cs" Inherits="UserInterface.Administrator.AdminPlates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../Content/bootstrap-switch.min.css" rel="stylesheet" />
    <script src="../scripts/bootstrap-switch.min.js"></script>

    <div class="page-header">
        <h1>Administración de platos</h1>
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
            <a class="btn btn-success" href="AddPlate.aspx"><i class="fa fa-plus"></i> Agregar Plato</a>
        </div>
        
    </div>

    <br />
    <br />
    <div class="table-responsive">

    <asp:GridView ID="grdPlatos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered bs-table" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="PRODUCTNAME" HeaderText="Nombre" ItemStyle-Width="90px" >
<ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DESCRIPTION" HeaderText="Descripción" ItemStyle-Width="200px" >

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Precio" ItemStyle-Width="60px" >
                <ItemTemplate>
                    ₡<%#Eval("PRICE")%>
                </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Imagen" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <img src='<%#Eval("IMAGEURI")%>' height="150" width="150"/>
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Editar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <a class="btn btn-default btn-sm" href="EditPlate.aspx?productID=<%#Eval("PRODUCT_ID")%>"><i class="fa fa-pencil-square-o"></i> Editar</a>
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Eliminar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <a class="btn btn-danger btn-sm" href="RemovePlate.aspx?productID=<%#Eval("PRODUCT_ID")%>"><i class="fa fa-trash"></i> Eliminar</a>
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Habilitar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <input type="checkbox" data-off-text="NO" data-on-text="SI" data-label-width="50" data-handle-width="50" name="my-checkbox"
                      
                        <%# (bool)(Eval("isoutofstock")) ? "checked" : ""%>
                         id="<%#Eval("PRODUCT_ID")%>">
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>

            

        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </div>

    <script type="text/javascript">
        $("[name='my-checkbox']").bootstrapSwitch();
        $("[name='my-checkbox']").on('switchChange.bootstrapSwitch', function (event, state) {
            var id = this.id;
            var state = !$('#' + id).bootstrapSwitch('state');
            console.log(state);
            $.ajax({
                url: "https://approgers.azurewebsites.net/Rogers_API.asmx/changeProductStateJSON?id=" + id + "&state=" + state,
                dataType: "jsonp"
            }).then(function(data) {
                console.log("state changed");
            });

        });
    </script>
</asp:Content>
