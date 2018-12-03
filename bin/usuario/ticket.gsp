<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="container">
      <div class="row">
          <div class="col-12">
              <div class="card mb-3">
                  <div class="card-header text-center">
                      Ticket del pago generado
                  </div>
              </div>
              <g:if test="${flash.message}">
                  <div class="alert alert-${flash.messageType} alert-dismissable">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
                      ${flash.message}
                  </div>
              </g:if>
              <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="${createLink(uri: '/')}">Inicio</a></li>
                      <li class="breadcrumb-item"><a href="${createLink(uri: '/usuario')}">Usuario</a></li>
                      <li class="breadcrumb-item">
                          <g:link class="breadcrumb-item" action="show" id="${datosPago.usuario.id}">Detalle</g:link>
                      </li>
                      <li class="breadcrumb-item active" aria-current="page">Ticket</li>

                  </ol>
              </nav>
              <div >
              <form id="printableArea">
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label>Numero de contrato</label>
                    <input id="numeroContrato" class="form-control" value="${datosPago.numeroDeContrato}" disabled>
                  </div>
                  <div class="form-group col-md-6">
                    <label>Fecha de creacion</label>
                    <input class="form-control" value="${datosPago.fechaDeCreacion}" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label>Servicio</label>
                  <input class="form-control" value="${datosPago.servicio}" disabled>
                </div>
                <div class="form-group">
                  <label>Descripcion del servicio</label>
                  <input class="form-control" value="${datosPago.servicioDescripcion}" disabled>
                </div>

                <div class="form-group">
                  <label >Paquete</label>
                  <input class="form-control" value="${datosPago.paquete}" disabled>
                </div>
                <div class="form-group">
                  <label >Descripcion del paquete</label>
                  <input class="form-control" value="${datosPago.paqueteDescripcion}" disabled>
                </div>

                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label >Pago realizado</label>
                    <input class="form-control" value="${datosPago.pagoRealizado}" disabled>
                  </div>

                  <div class="form-group col-md-2">
                    <label >Nombre</label>
                    <input class="form-control" value="${datosPago.usuarioNombre}" disabled>
                  </div>

                  <div class="form-group col-md-2">
                    <label >Apellido p</label>
                    <input class="form-control" value="${datosPago.usuarioApellidoP}" disabled>
                  </div>

                  <div class="form-group col-md-2">
                    <label>Apellido M</label>
                    <input class="form-control" value="${datosPago.usuarioApellidoM}" disabled>
                  </div>
                </div>

              </form>
              </div>

              <input type="button" onclick="printDiv('printableArea')" class="btn btn-info" value="Imprimir" />



          </div>
      </div>
    </div>

    <script>
        window.onload=function (ev) {
            constructor();
        };
    var printContents;

    function constructor() {
        this.printContents=document.getElementById("printableArea").innerHTML;
    }
    
    function printDiv(printableArea) {

     var originalContents = document.body.innerHTML;

     document.body.innerHTML = this.printContents;
     window.print();

     document.body.innerHTML = originalContents;
    }

    </script>

  </body>
</html>
