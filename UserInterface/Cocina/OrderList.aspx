<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="UserInterface.Cocina.OrderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/ico" />
    <title>Cocina</title>
    <script src="../scripts/ThreadManagement.js"></script>
    <script src="../scripts/OrderCreator.js"></script>
    <script src="../scripts/jquery-3.0.0.min.js"></script>
    <link href="../Content/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"/>

</head>
<body onload="CargarOrdenes()">
    <form id="form1" runat="server">
        <div id="header">
            <img id="logo" src="../images/logo.png" />
            <i class="fa fa-mail-reply-all" id="regresar" onclick="RegresarOrden()"></i>
        </div>
        <div id="Principal">
            <ul id="listapedidos">
                
            </ul>
            <ul id="listaespera">

            </ul>
        </div>
        <input type="hidden" value="" id="lastId"/>
    </form>
    <div id="footer">
       <h4 id="leyenda">Existen más ordenes sin mostrar</h4>
    </div>
</body>
</html>
