// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "./jquery.min.js"
import "./bootstrap.bundle.min.js"
import "./javascript/sb-admin-2.min.js"
import { application } from "stimulus"


/*document.addEventListener("turbolinks:load", function() {
  $("#buscador_productos").keyup(function(event){
    let termino = $(this).val();
    let id_modelo = $(this).data("model");
    let tipo_modelo = $(this).data("tipo");
    if (termino.length == 0) {
      $("#tabla_buscador tbody").empty();
    }
    else {
      request_url = getRootUrl() + "/buscador_productos/" + termino;
      $.get(request_url, function(data, status){
        if(data.length > 0) {
          $("#tabla_buscador tbody").empty();
          for(x in data){
            let nombre_producto = data[x].description;
            let existencia = data[x].amount;
            let id_producto = data[x].id;
            newRowContent = `<tr>
                                <td>${nombre_producto}</td>
                                <td>${existencia}</td>
                                <td><button type="button" class="btn btn-primary" onclick="seleccionarProducto(${id_producto}, ${id_modelo},'${tipo_modelo}')">
                                Agregar
                                  </button>
                                </td>
                            </tr>`;
            $("#tabla_buscador tbody").append(newRowContent);
          }
        }
      });
    }
  })
});

function seleccionarProducto(id_producto, id_modelo, tipo_modelo) {
  switch(tipo_modelo){
    case 'sales':
      agregarItemVent(id_producto, id_modelo);
      break;
      case 'warehouse':
        break;
  }
}

function agregarItemVent(id_producto, id_venta){
  let cantidad_inicial = $('#cantidad_producto').val();
  let request_url = getRootUrl() + "/add_item_venta/";
  info = { product_id: id_producto, id: id_venta, cantidad: cantidad_inicial }
  $.ajax({
    url: request_url,
    type: 'POST',
    data: JSON.stringify(info),
    contentType: "application/json; charset=utf-8",
    success: function(result){
      if(result != null ) {
        $("#buscador_producto").modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
        let cantidad = result.cantidad;
        let price = result.price_product;
        let importe_item = result.importe_item;
        let importe_venta = result.importe_venta;
        let nombre_prod = result.nombre_prod;
        //let product_id = result.product_id;
        let newRowContent = "<tr><td>"+nombre_prod+"</td><td>"+price+"</td><td>"+cantidad_inicial+"</td><td>$"+importe_item+"</td></tr>";
        $("#tabla_ventas tbody").append(newRowContent);
        $("#importe_venta_lbl").text("Total: $"+importe_venta);
      }
    }
  });
}

function getRootUrl(){
  return window.location.origin;
}*/
document.addEventListener("turbo:load", function() {
  const buscadorProductos = document.getElementById("input_buscador_producto");

  if (buscadorProductos) {
    buscadorProductos.addEventListener("input", function(event) {
      let termino = event.target.value;
      let idModelo = event.target.dataset.model;
      let tipoModelo = event.target.dataset.tipo;

      if (termino.length === 0) {
        document.getElementById("tabla_buscador").querySelector("tbody").innerHTML = "";
      } else {
        let requestUrl = getRootUrl() + "/buscador_productos/" + termino;
        fetch(requestUrl)
          .then(response => response.json())
          .then(data => {
            if (data.length > 0) {
              let tbody = document.getElementById("tabla_buscador").querySelector("tbody");
              tbody.innerHTML = "";
              data.forEach(function(item) {
                let nombreProducto = item.description;
                let existencia = item.amount;
                let idProducto = item.id;
                let newRowContent = `<tr>
                                      <td>${nombreProducto}</td>
                                      <td>${existencia}</td>
                                      <td><button type="button" class="btn btn-primary" onclick="seleccionarProducto(${idProducto}, ${idModelo},'${tipoModelo}')">
                                      Agregar
                                        </button>
                                      </td>
                                    </tr>`;
                tbody.insertAdjacentHTML("beforeend", newRowContent);
              });
            }
          });
      }
    });
  }
});

function seleccionarProducto(idProducto, idModelo, tipoModelo) {
  switch(tipoModelo){
    case 'sales':
      agregarItemVenta(idProducto, idModelo);
      break;
    case 'warehouse':
      break;
  }
}

function agregarItemVenta(idProducto, idVenta) {
  let cantidadInicial = document.getElementById("cantidad_producto").value;
  let requestUrl = getRootUrl() + "/add_item_venta/";
  let info = { product_id: idProducto, id: idVenta, cantidad: cantidadInicial };

  fetch(requestUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(info)
  })
  .then(response => response.json())
  .then(result => {
    if (result !== null) {
      document.getElementById("buscador_producto").modal('hide');
      $('#buscador_producto').modal('show');
      document.body.classList.remove('modal-open');
      document.querySelector('.modal-backdrop').remove();
      let cantidad = result.cantidad;
      let price = result.price_product;
      let importeItem = result.importe_item;
      let importeVenta = result.importe_venta;
      let nombreProd = result.nombre_prod;
      let newRowContent = `<tr><td>${nombreProd}</td><td>${price}</td><td>${cantidadInicial}</td><td>$${importeItem}</td></tr>`;
      document.getElementById("tabla_ventas").querySelector("tbody").insertAdjacentHTML("beforeend", newRowContent);
      document.getElementById("importe_venta_lbl").textContent = "Total: $" + importeVenta;
    }
  });
}

function getRootUrl() {
  return window.location.origin;
}

