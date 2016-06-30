function CargarOrdenes() {
  
    var WSurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchOrdersJSON';

    var req = $.ajax({
        url: WSurl,
        datype: 'json',
        timeout: 10000,
        success: function (datos) { ProcesarOrdenes(datos) }
    });

}

function AgregarOrden() {
    var WSurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchOrdersJSON';
    var req = $.ajax({
        url: WSurl,
        datype: 'json',
        timeout: 10000,
        success: function (datos) { ProcesarOrdenes(datos) }
    });
}

function ProcesarOrdenes(datos) {
    var ul = document.getElementById('listapedidos');
    var contador = 0;
    $.each(JSON.parse(datos), function () {
        CrearNuevaOrden(ul, ++contador, this.ORDERID);
        if (contador >= 10) {
            document.getElementById('li' + this.popularity).style.display = "none";
            document.getElementById('footer').style.display = "block";
        }
    });
}

function CrearNuevaOrden(ul, contador, id) {
    var li = document.createElement('li');
    li.id = "li" + id;

    var divContenedor = document.createElement('div');
    divContenedor.id = "contenedor"+id;
    divContenedor.className = "contenedor";

    var divEstado = document.createElement('div');
    divEstado.className = "estado";
    divEstado.id = "estado"+id;

    var spanId = document.createElement('span');
    spanId.className = "id";
    spanId.innerHTML = contador;
    var spanTiempo = document.createElement('span');
    spanTiempo.innerHTML = "Tiempo restante: ";
    var spanMinutos = document.createElement('span');
    spanMinutos.className = "minutes";
    var spanSegundos = document.createElement('span');
    spanSegundos.className = "seconds";
    var salto = document.createElement('br');
    var spanEstado = document.createElement('span');
    spanEstado.className = "estados";
    spanEstado.innerHTML = "A TIEMPO"
    
    divEstado.appendChild(spanId);
    divEstado.appendChild(spanTiempo);
    divEstado.appendChild(spanMinutos);
    divEstado.appendChild(spanSegundos);
    divEstado.appendChild(salto);
    divEstado.appendChild(spanEstado);

    var divCliente = document.createElement('div');
    divCliente.className = "cliente"

    var img = document.createElement('img');
    img.className = "profile";
    img.src = "../images/background.jpg";

    var p = document.createElement('p');
    p.innerHTML = "Cliente";

    divCliente.appendChild(img);
    divCliente.appendChild(p);

    var divDetalles = document.createElement('div');
    divDetalles.className = "detalles";

    var WSPurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchOrdersJSON';
    var req = $.ajax({
        url: WSPurl,
        timeout: 10000,
        success: function (datos) { ProcesarProductos(datos) }
    });

    function ProcesarProductos(datos) {
        $.each(JSON.parse(datos), function () {
            var cantidad = document.createElement('p');
            cantidad.className = "cantidad";
            var cant = document.createTextNode("1");
            cantidad.appendChild(cant);
            
            var producto = document.createElement('p');
            producto.className = "producto";
            var detalle = document.createTextNode(this.ORDERID);
            producto.appendChild(detalle);
            divDetalles.appendChild(cantidad);
            divDetalles.appendChild(producto);
        });
    }

    var divBoton = document.createElement('div');
    divBoton.className = "botones";

    var boton = document.createElement('input');
    boton.type = "button";
    boton.className = "btEntregar";
    boton.value = "Entregar"

    boton.addEventListener('click', (function () {
        var IdPedido = li.id;
        return function () {
            document.getElementById("lastId").value = IdPedido;
            elemento = document.getElementById(IdPedido);
            elemento.parentNode.removeChild(elemento);
        }
    })());

    divBoton.appendChild(boton);

    divContenedor.appendChild(divEstado);
    divContenedor.appendChild(divCliente);
    divContenedor.appendChild(divDetalles);
    divContenedor.appendChild(divBoton);

    li.appendChild(divContenedor);

    ul.appendChild(li);

    var WSSurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchOrderStateJSON';
    var req = $.ajax({
        url: WSSurl,
        timeout: 10000,
        success: function (datos) { ProcesarProductos(datos) }
    });

    iniciar(divContenedor.id, divEstado.id, 2.2);
}