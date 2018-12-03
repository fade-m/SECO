<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.3.1.min.js"/>

    </head>
    <body>
    
<style>
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 10px;
}
</style>

 <nav aria-label="breadcrumb">
           <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${createLink(uri: '/')}">Inicio</a></li>
                <li class="breadcrumb-item"><a href="${createLink(uri: '/usuario')}">Usuario</a></li>
                <li class="breadcrumb-item">
                    <g:link class="breadcrumb-item" action="show" id="${usuario.id}">Detalle</g:link>
                </li>

               <li class="breadcrumb-item active" aria-current="page">Contratos</li>
           </ol>
       </nav>


<g:each  in="${contratos}" var="c">
                   <div class="modal fade" id="modal${c.id}" tabindex="-1"
                        role="dialog" aria-labelledby="tituloModal" aria-hidden="true">
                       <div class="modal-dialog" role="document">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <h5 class="modal-title" id="tituloModal">
                                       <strong>Advertencia</strong>
                                   </h5>
                                   <button type="button" class="close" data-dismiss="modal"
                                           aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                   </button>
                               </div>

                               <div class="modal-body text-center bg-danger text-white">
                                   ¿Está seguro que desea Desvincular este Servicio?<br>
                                   Se borrarán todos los registros pertinentes a el.<br>
                                   "<strong> ${c.id} ${c.numeroDeContrato}</strong>"
                                   <br />
                                   <br />

                               </div>

                               <div class="modal-footer">
                                   <button type="button" class="btn btn-secondary"
                                           data-dismiss="modal">Cancelar</button>
                                           <g:link action="delete" id="${c.id}" controller="contrato"
                                           class="btn btn-danger">
                                            Desvincular
                                            </g:link>
                               </div>

                           </div>
                       </div>
                   </div>
               </g:each>

<h2>Contratos Vinculados a: ${usuario.nombre} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}  </h2><br>
<div class="hidden" id="SuperFecha2"> </div>
<div class="">
        <table class="table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg" id="dataTable1" width="100%" cellspacing="0">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Id</th>
                                            <th>Usuario</th>
                                            <th>Número de Contrato</th>
                                            <th>Fecha de Creación</th>
                                            <th>Precio Fijo</th>
                                            <th>Pagos</th>
                                            <th>Usuario</th>
                                            <th>Servicio</th>
                                            <th>Paquete</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                          
                                            <g:each in="${contratos}">
                                              <tr>
                                                <th scope="row">${it.id}</th>
                                                <th> ${it.usuario}</th>
                                                <td>${it.numeroDeContrato}</td>
                                                <td>${it.fechaDeCreacion}</td>
                                                <td>
                                                    <g:if test="${it.isPrecioFiijo}">
                                                        Si
                                                    </g:if>
                                                    <g:else>
                                                        No
                                                    </g:else>


                                                </td>
                                                <td>${it.pagos}</td>
                                                <td>${it.usuario}</td>
                                                <td>${it.servicio}</td>
                                                <td>${it.paquete}</td>
                                                <td>
                                                <button class="btn btn-danger" data-target="#modal${it.id}" data-toggle="modal">Desvincular</button>
                                                </td>
                                                </tr>
                                            </g:each>
                                            
                                    </tbody>
            </table>
    </div>



 <script>
  var objToday = new Date(),
	weekday = new Array('Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'),
	dayOfWeek = weekday[objToday.getDay()],
	domEnder = function() { var a = objToday; if (/1/.test(parseInt((a + "").charAt(0)))) return ""; a = parseInt((a + "").charAt(1)); return 1 == a ? "" : 2 == a ? "" : 3 == a ? "" : "" }(),
	dayOfMonth = today + ( objToday.getDate() < 10) ? '0' + objToday.getDate() + domEnder : objToday.getDate() + domEnder,
	months = new Array('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Deciembres'),
	curMonth = months[objToday.getMonth()],
	curYear = objToday.getFullYear(),
	curHour = objToday.getHours() > 12 ? objToday.getHours() - 12 : (objToday.getHours() < 10 ? "0" + objToday.getHours() : objToday.getHours()),
	curMinute = objToday.getMinutes() < 10 ? "0" + objToday.getMinutes() : objToday.getMinutes(),
	curSeconds = objToday.getSeconds() < 10 ? "0" + objToday.getSeconds() : objToday.getSeconds(),
	curMeridiem = objToday.getHours() > 12 ? "PM" : "AM";
var today = curHour + ":" + curMinute + "." + curSeconds + curMeridiem + " " + dayOfWeek + " " + dayOfMonth + " de " + curMonth + " de " + curYear;

document.getElementById('SuperFecha').innerHTML = today;

</script>





<h2>Servicios Disponbles</h2><br>
<div class="">
        <table class="table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg" id="dataTable2" width="100%" cellspacing="0">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Id</th>
                                            <th>Imagen</th>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                            <th>Tipo De Servicio</th>
                                            <th>Paquetes</th>
                                            <th>Vincular</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            <g:each var="servicio" in="${allServicios}">
                                              <tr>
                                                <th scope="row">${servicio.id}</th>
                                                <td>${servicio.imagen}</td>
                                                <td>${servicio.nombre}</td>
                                                <td>${servicio.descripcion}</td>
                                                <td>${servicio.tipoServicio}</td>
                                                <td>${servicio.paquetes}</td>
                                                <td>
                                                <button type="button" class="btn btn-info text-white" data-target="#modal2${servicio.id}" data-toggle="modal">Vincular</button>
                                                </td>
                                                </tr>
                                            </g:each>
                                    </tbody>
            </table>
    </div>
<style>
@media (min-width: 768px) {
  .modal-xl {
    width: 90%;
   max-width:1200px;
  }
}
</style>

<g:each var="servicio" in="${allServicios}">
<g:form controller="contrato" method="POST" action="contratar" id="${this.usuario.id}" params="['servicio.id':servicio.id]">
<div class="modal fade bd-example-modal-xl" id="modal2${servicio.id}" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true" role="dialog">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
            <div class="col-12 modal-title text-center">
                <strong>Crear Contrato de Servicio : </strong>
                ${usuario.nombre} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}<br>
                <strong>Celebrado el: </strong><span id="fecha${servicio.id}">
       </span>
            </div>
       

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!--DATOS DE CONTRATO-->
          <h4><i>Datos del Contrato</i></h4>
            
            <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="numContrato">Número de Contrato</label>
                          <input type="text" name="numeroDeContrato" class="form-control" id="numeroDeContrato" placeholder="Número de Contrato" required>
                        </div>
                  <div class="form-group col-md-6">
                        <div class="form-check text-center">
                          <label class="text-center" for="gridCheck">¿Es Precio Fijo? </label>
                          <g:checkBox class="form-control"name="isPrecioFiijo" id="isPrecioFiijo" value="${false}" />    
                          </div>
                  </div>
            </div>
          

          <!--DATOS DE SERVICIO-->
          <h4><i>Datos del Servicio</i></h4>
         
            <div class="form-row">
                        <div class="form-group col-md-2 text-center">
                          <asset:image src="grails.svg" height="auto" class="d-inline-block align-top" />
                        </div>
                        <div class="form-group col-md-5">
                          <label for="nombreServicio">Nombre del Servicio:</label>
                          <input type="text" name="nombreServicio" class="form-control" id="nombreServicio" value="${servicio.nombre}" disabled>
                        </div>
                        <div class="form-group col-md-5">
                          <label for="tipoServicio">Tipo del Servicio:</label>
                          <input type="text" name="tipoServicio" class="form-control" id="tipoServicio" value="${servicio.tipoServicio}" disabled>
                        </div>     
            </div>
            <div class="form-row">
                        <div class="form-group col-md-12">
                          <label for="descripcionServicio">Descripción:</label>
                          <input type="text" name="descripcionServicio" class="form-control" id="descripcionServicio" value="${servicio.descripcion}" disabled>
                        </div>
            </div>
          

<!--DATOS DE SERVICIO-->
          <h4><i>Paquetes Disponibles</i></h4><br>
          <div class="input-group mb-3">
              <div class="input-group-prepend">
                  <label class="input-group-text" for="inputGroupSelect01">Paquetes</label>
              </div>
              <select class="custom-select" id="inputGroupSelect01" name="paquete" >
                  <g:each var="p" in="${servicio.paquetes}">
                      <option value="${p.id}">${p.nombre}</option>
                  </g:each>
              </select>
          </div>
            <div class="form-row">
                        <div class="form-group col-md-12 text-center">

              </div>           
            </div>  
<br>
</div>
            <div class="modal-footer">
                  <button type="button" class="btn btn-secondary col-4" data-dismiss="modal">Cancelar</button>
                  <input type="submit" class="btn btn-success col-8" value="Crear">
            </div>
    </div>
  </div>
</div>

 <script>
        document.getElementById("fecha${servicio.id}").innerHTML=document.getElementById("SuperFecha").innerHTML;
 </script>
 </g:form>
 </g:each>
    <asset:javascript src="jquery.min.js"/>
    <script>
        $(function () {
            $('#dataTable1').dataTable({
                "lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                "lengthChange": true,
                "paging": true,
                "searching": true,
                "length": true,
                "autoWidth": true,
                "order": [[0, "asc"]],
                "language": {
                    "emptyTable": "Sin registros",
                    "info": "Registros _START_ a _END_. Total: _TOTAL_",
                    "infoEmpty": "Sin registros por mostrar",
                    "infoFiltered": "(_MAX_ registros filtrados)",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron resultados",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Fin",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                }
            });

        });
        $(function () {
            $('#dataTable2').dataTable({
                "lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                "lengthChange": true,
                "paging": true,
                "searching": true,
                "length": true,
                "autoWidth": true,
                "order": [[0, "asc"]],
                "language": {
                    "emptyTable": "Sin registros",
                    "info": "Registros _START_ a _END_. Total: _TOTAL_",
                    "infoEmpty": "Sin registros por mostrar",
                    "infoFiltered": "(_MAX_ registros filtrados)",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron resultados",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Fin",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                }
            });

        });
    </script>
</body>
</html>


