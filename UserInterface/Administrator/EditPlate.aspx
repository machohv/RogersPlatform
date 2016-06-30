<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="EditPlate.aspx.cs" Inherits="UserInterface.Administrator.EditPlate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h1>Editar platillo</h1>
    </div>
    <br />

    
    <div class="form-group">
        <label class="control-label col-sm-2" for="txtNombre">Nombre:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="txtDescripcion">Descripción:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDescripcion" runat="server" class="form-control" placeholder="Descripcion" TextMode="MultiLine" Rows="5"></asp:TextBox>
        </div>
    </div>
    <br />
    <div class="form-group">
        <label class="control-label col-sm-2" for="txtPrecio">Precio:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtPrecio" runat="server" class="form-control" placeholder="Precio"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrecio" ErrorMessage="El precio debe ser numérico" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
    </div>

   

    <div class="form-group">
            <label class="control-label col-sm-2" >Imagen:</label>
            <div class="col-sm-5">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
            <div class="col-sm-5">
                <asp:Button ID="btnSearchImage" runat="server" Text="Buscar en la Web" class="btn btn-primary" CausesValidation="false" OnClick="btnSearchImage_Click"/>
            </div>

        
        <asp:Image ID="Image" runat="server"/>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">

            <asp:Button ID="btnAddPlate" runat="server" Text="Editar" class="btn btn-success" OnClick="btnAddPlate_Click"/>
        </div>
    </div>
</asp:Content>

