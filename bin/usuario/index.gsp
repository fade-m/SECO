<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="container">
        <div class="row">
            <div class="col-12">
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
                        <li class="breadcrumb-item active" aria-current="page">Usuario</li>
                    </ol>
                </nav>
                <div class="card mb-3">
                    <div class="card-header text-center">
                        Lista de terminales y usuarios
                    </div>
                </div>
                <g:each in="${terminales}" var="term">

                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Terminal: ${term.username}
                        </div>

                        <div class="card-body">
                            <div class="tab-pane">
                                <table class="table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg" id="dataTable" width="100%" cellspacing="0">
                                    <thead  class="thead-dark">
                                    <tr>
                                        <th scope="col" class="text-center">Id</th>
                                        <th scope="col" class="text-center">Nombre</th>
                                        <th scope="col" class="text-center">Apellido Paterno</th>
                                        <th scope="col" class="text-center">Apellido Materno</th>
                                        <th scope="col" class="text-center">Opciones</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <g:each var="usu" in="${usuarioList}">
                                        <g:if test="${usu.superior==term}">
                                            <tr>
                                                <th scope="row">${usu.id}</th>
                                                <td class="text-center">${usu.nombre}</td>
                                                <td class="text-center">${usu.apellidoPaterno}</td>
                                                <td class="text-center">${usu.apellidoMaterno}</td>
                                                <td class="text-center">
                                                <g:link controller="usuario" class="btn btn-secondary text-white" action="edit" id="${usu.id}">
                                                    Editar
                                                </g:link>
                                                <g:link class ="btn btn-danger text-white" action="delete" controller="usuario" id="${usu.id}">
                                                    Eliminar
                                                </g:link>
                                                <g:link controller="usuario" class="btn btn-info text-white" action="show" id="${usu.id}">
                                                    Ver Detalle
                                                </g:link>
                                                </td>
                                            </tr>
                                        </g:if>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
    </div>


          <asset:javascript src="jquery.min.js"/>
          <script>

          $(function () {
              $('table').dataTable({
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
