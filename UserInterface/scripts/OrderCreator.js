function CargarOrdenes() {
  
    var WSurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchOrdersJSON';

    var req = $.ajax({
        url: WSurl,
        datype: 'json',
        timeout: 10000,
        success: function (datos) { ProcesarOrdenes(datos) }
    });

}

function RegresarOrden() {
    var IdPedido = document.getElementById("lastId").value;
    document.getElementById(IdPedido).style.display = "inline-block";
    document.getElementById("lastId").value = "clear";
}

function ProcesarOrdenes(datos) {
    var ul = document.getElementById('listapedidos');
    var cont = document.getElementById('contador').value;
    $.each(JSON.parse(datos), function () {
        var ul = document.getElementById('listapedidos');
        if (ul.lastElementChild == null) {
            CrearNuevaOrden(ul, cont, this);
            cont++;
        } else if (this.ORDERID > ul.lastElementChild.id) {
            CrearNuevaOrden(ul, cont, this);
            if (cont++ > 10) {
                document.getElementById('li' + this.ORDERID).style.display = "none";
                document.getElementById('footer').style.display = "block";
            }
        }
    });
    document.getElementById('contador').value = cont;
}

function CrearNuevaOrden(ul, contador, pedido) {
    var li = document.createElement('li');
    li.id = pedido.ORDERID;

    var divContenedor = document.createElement('div');
    divContenedor.id = "contenedor"+pedido.ORDERID;
    divContenedor.className = "contenedor";

    var divEstado = document.createElement('div');
    divEstado.className = "estado";
    divEstado.id = "estado"+pedido.ORDERID;

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
    img.src = pedido.PICTUREURL;

    var p = document.createElement('p');
    p.innerHTML = pedido.FULLNAME;

    divCliente.appendChild(img);
    divCliente.appendChild(p);

    var divDetalles = document.createElement('div');
    divDetalles.className = "detalles";

    var WSPurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/searchProductsOrderIdJSON?id=' + pedido.ORDERID;
    var req = $.ajax({
        url: WSPurl,
        timeout: 10000,
        success: function (productos) { ProcesarProductos(productos) }
    });

    function ProcesarProductos(productos) {
        $.each(JSON.parse(productos), function () {
            var cantidad = document.createElement('p');
            cantidad.className = "cantidad";
            var cant = document.createTextNode("1");
            cantidad.appendChild(cant);
            
            var producto = document.createElement('p');
            producto.className = "producto";
            var detalle = document.createTextNode(this.PRODUCTNAME);
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

        var Id = pedido.ORDERID;
        var IdPedido = li.id;
        var LastId = document.getElementById("lastId");

        return function () {

            var elem = document.getElementById(LastId.value);

            if (elem != null) {
                elem.parentNode.removeChild(elem);
                
            }

            alert(Id);
            //var WSSurl = 'http://approgers.azurewebsites.net/Rogers_API.asmx/' + Id;
            //var req = $.ajax({
            //    url: WSSurl,
            //    timeout: 10000,
            //    success: function (productos) { alert("ORDEN: " + Id + " ENTREGADA") }
            //});

            LastId.value = IdPedido;
            document.getElementById(IdPedido).style.display="none";
        }
    })());

    divBoton.appendChild(boton);

    divContenedor.appendChild(divEstado);
    divContenedor.appendChild(divCliente);
    divContenedor.appendChild(divDetalles);
    divContenedor.appendChild(divBoton);

    li.appendChild(divContenedor);

    ul.appendChild(li);

    iniciar(divContenedor.id, divEstado.id, 2.3);
}

var interval = setInterval(CargarOrdenes, 5000);