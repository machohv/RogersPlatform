<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMP.Master" AutoEventWireup="true" CodeBehind="ImageSearch.aspx.cs" Inherits="UserInterface.Administrator.ImageSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../Content/imageGallery.css" rel="stylesheet" />
    

    <div class="page-header">
        <img src="../images/bingLogo.png" /> <h1>Buscar en la web</h1>
    </div>

     <div class="row">
        <div class="col-lg-6">
            <div class="input-group custom-search-form">
                <input id="txtParam" type="text" placeholder="Buscar..." class="form-control"/>
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="btnSearch">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </div>
     </div>
     <br />

     <div id="imagediv">
  
    </div>
    <script src="../scripts/BingSearch.js"></script>

</asp:Content>
