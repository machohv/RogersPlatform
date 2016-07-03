<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="AdminClients.aspx.cs" Inherits="UserInterface.Administrator.AdminClients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/bootstrap-switch.min.css" rel="stylesheet" />
    <script src="../scripts/bootstrap-switch.min.js"></script>

    <div class="page-header">
        <h1>Administración de clientes</h1>
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
        
    </div>

    <br />
    <br />
    <div class="table-responsive">

    <asp:GridView ID="grdPlatos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered bs-table">
        <Columns>
            <asp:BoundField DataField="FULLNAME" HeaderText="Nombre Completo" ItemStyle-Width="90px" >
<ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EMAIL" HeaderText="Correo Electrónico" ItemStyle-Width="200px" >

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Imagen" ItemStyle-Width="50px" >
                <ItemTemplate>
                    <img src='<%#Eval("PROFILEPICTUREURL")%>' class="img-rounded" height="50" width="50"/>
                </ItemTemplate>

<ItemStyle Width="50px"></ItemStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Habilitar" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <input type="checkbox" data-off-text="NO" data-on-text="SI" data-label-width="50" data-handle-width="50" name="my-checkbox"
                      
                        <%# (bool)(Eval("isACTIVE")) ? "checked" : ""%>
                         id="<%#Eval("PERSON_ID")%>">
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>

            

        </Columns>
    </asp:GridView>
        
    </div>

    <script type="text/javascript">
        $("[name='my-checkbox']").bootstrapSwitch();
        $("[name='my-checkbox']").on('switchChange.bootstrapSwitch', function (event, state) {
            var id = this.id;
            var state = $('#' + id).bootstrapSwitch('state');
            console.log(state);
            $.ajax({
                url: "https://rogersapp.azurewebsites.net/Rogers_API.asmx/changeStateJSON?id=" + id + "&state=" + state,
                dataType: "jsonp"
            }).then(function(data) {
                console.log("state changed");
            });

        });
    </script>
</asp:Content>
