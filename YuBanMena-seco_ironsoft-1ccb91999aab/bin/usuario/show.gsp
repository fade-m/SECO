<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>




<div class="container">
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
            <li class="breadcrumb-item active" aria-current="page">Detalle</li>
        </ol>
    </nav>
    <div class="row m-y-2">
        <div class="col-lg-12 push-lg-12">
            <ul class="nav nav-tabs">
                <br>
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Datos Personales</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#servicios" data-toggle="tab" class="nav-link">Servicios</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#pagos" data-toggle="tab" class="nav-link">Pagos</a>
                </li>
                <sec:noAccess expression="hasRole('ROLE_USUARIO')">
                    <li class="nav-item">
                        <a href="" data-target="#editar" data-toggle="tab" class="nav-link">Editar</a>
                    </li>
                </sec:noAccess>
            </ul>
            <br>
            <div class="tab-content p-b-3">
                <div class="tab-pane active" id="profile">
                    <h4 class="m-y-2">Datos Personales</h4>

                    <div class="row">
                        <div class="col-md-6">
                            <h6>Nombre:</h6>
                            <p>
                                ${usuario.nombre}
                            </p>
                            <h6>Dirección</h6>
                            <p>
                                ${usuario.direccion}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <h6>Apellidos</h6>
                            ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}

                            <hr>
                            <h6>Servicios</h6>
                            <g:if test="${cuenta?.contratos?.size()==0}">
                                <p>No hay servicios contratados</p>
                            </g:if>
                            <g:each in="${cuenta?.contratos}">
                                <span class="tag tag-primary"><i class="fa fa-box"></i>${it.servicio.nombre}</span>
                            </g:each>
                        </div>
                        <br><br>
                        <div class="col-md-12">
                            <h4 class="m-t-2"><span class="fa fa-clock-o ion-clock pull-xs-right"></span>Últimos Movimientos</h4>
                            <table class="table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg">
                                <tbody>
                                <g:if test="${ultimosPagos.size()==0}">
                                    <p>No hay movimientos</p>
                                </g:if>
                                <g:each in="${ultimosPagos}">
                                    <tr>
                                        <td>
                                            <strong>Pago ${it.id}</strong> Realizado el: ${it.fechaPago.dateTimeString} <strong>${it.estado.descripcion} ${it.costoFinal}</strong>
                                        </td>
                                    <tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <div class="tab-pane" id="servicios">
                    <h4 class="m-y-2">Servicios Vinculados a: ${usuario.nombre} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}</h4>
                    <table class="table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg" id="dataTable1">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="text-center">Número de cuenta</th>
                            <th scope="col" class="text-center">Servicio</th>
                            <th scope="col" class="text-center">Descripción</th>
                            <th scope="col" class="text-center">Estado</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${cuenta?.contratos}">
                            <tr>
                                <th scope="row" class="text-center">${it.numeroDeContrato}</th>
                                <td class="text-center">${it.servicio.nombre}</td>
                                <td class="text-center">${it.servicio.descripcion}</td>
                                <td class="text-center">
                                    <g:if test="${it.pagos.size()!=0}">
                                        <g:if test="${it?.pagos?.sort()?.first()?.isAdeudo()}">

                                        <sec:ifLoggedIn>

                                            <sec:access expression="hasRole('ROLE_USUARIO')">
                                                <p class="text-center">Adeudo</p>
                                            </sec:access>
                                            <sec:access expression="hasRole('ROLE_ADMIN')">
                                                <p class="text-center">Adeudo</p>
                                            </sec:access>

                                          <sec:access expression="hasRole('ROLE_TERMINAL')">



                                          <button type="button" data-toggle="modal" class="btn btn-danger" data-target="#exampleModalLong${it.id}">En adeudo</button>

                                          <div class="modal fade bd-example-modal-lg" id="exampleModalLong${it.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-lg" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <div class="card col-12 text-center">
                                                      <div class="card-header">
                                                          Pago
                                                      </div>
                                                  </div>
                                                </div>

                                                <div class="modal-body">
                                                  <g:form action="ticket" method="POST">
                                                      <input name="idUsuario" class="form-control" value="${it.usuario.id}" hidden>
                                                      <input name="idContrato" class="form-control" value="${it.id}" hidden>
                                                      <div class="form-row">
                                                      <div class="form-group col-md-6">
                                                        <label>Numero de contrato</label>
                                                        <input name="numeroDeContrato" class="form-control" value="${it.numeroDeContrato}" readonly>
                                                      </div>
                                                      <div class="form-group col-md-6">
                                                        <label>Fecha de creacion</label>
                                                        <input class="form-control" name="fechaDeCreacion" value="${new Date()}" readonly>
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <label>Servicio</label>
                                                      <input class="form-control" name="servicio" value="${it.servicio.nombre}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                      <label>Descripcion del servicio</label>
                                                      <input class="form-control" name="descripcionDelServicio" value="${it.servicio.descripcion}" readonly>
                                                    </div>

                                                    <div class="form-group">
                                                      <label >Paquete</label>
                                                      <input class="form-control" name="paquete" value="${it.paquete.nombre}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                      <label >Descripcion del paquete</label>
                                                      <input class="form-control" name="descripcionDelPaquete" value="${it.paquete.descripcion}" readonly>
                                                    </div>

                                                    <div class="form-row">
                                                      <div class="form-group col-md-6">
                                                        <label >Pago realizado</label>
                                                        <input class="form-control" name="pagoRealizado" type="number" value="${it.paquete.precio}">
                                                      </div>

                                                      <div class="form-group col-md-2">
                                                        <label >Nombre</label>
                                                        <input class="form-control" name="nombreUsuario" value="${it.usuario.nombre}" readonly>
                                                      </div>

                                                      <div class="form-group col-md-2">
                                                        <label >Apellido P</label>
                                                        <input class="form-control" name="apellidoPaterno" value="${it.usuario.apellidoPaterno}" readonly>
                                                      </div>

                                                      <div class="form-group col-md-2">
                                                        <label>Apellido M</label>
                                                        <input class="form-control" name="apellidoMaterno" value="${it.usuario.apellidoMaterno}" readonly>
                                                      </div>
                                                    </div>

                                                    <button type="submit" class="btn btn-danger">Pagar</button>
                                                  </g:form >
                                                </div>
                                                <div class="modal-footer">

                                                </div>
                                              </div>
                                            </div>
                                          </div>

                                          <!--
                                            <g:form id="${it.id}" action="ticket" controller="usuario" method="post">
                                                <button type="submit" class="btn btn-danger">En adeudo</button>
                                            </g:form >

                                          -->
                                          </sec:access>
                                        </sec:ifLoggedIn>
                                        </g:if>
                                        <g:else>
                                            Sin adeudo
                                        </g:else>
                                    </g:if>
                                    <g:else>
                                        <sec:access expression="hasRole('ROLE_TERMINAL')">



                                            <button type="button" data-toggle="modal" class="btn btn-danger" data-target="#exampleModalLong${it.id}">En adeudo</button>

                                            <div class="modal fade bd-example-modal-lg" id="exampleModalLong${it.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <div class="card col-12 text-center">
                                                                <div class="card-header">
                                                                    Pago
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="modal-body">
                                                            <g:form action="ticket" method="POST">
                                                                <input name="idUsuario" class="form-control" value="${it.usuario.id}" hidden>
                                                                <input name="idContrato" class="form-control" value="${it.id}" hidden>

                                                                <div class="form-row">
                                                                    <div class="form-group col-md-6">
                                                                        <label>Numero de contrato</label>
                                                                        <input name="numeroDeContrato" class="form-control" value="${it.numeroDeContrato}" readonly>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label>Fecha de creacion</label>
                                                                        <input class="form-control" name="fechaDeCreacion" value="${new Date()}" readonly>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Servicio</label>
                                                                    <input class="form-control" name="servicio" value="${it.servicio.nombre}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Descripcion del servicio</label>
                                                                    <input class="form-control" name="descripcionDelServicio" value="${it.servicio.descripcion}" readonly>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label >Paquete</label>
                                                                    <input class="form-control" name="paquete" value="${it.paquete.nombre}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label >Descripcion del paquete</label>
                                                                    <input class="form-control" name="descripcionDelPaquete" value="${it.paquete.descripcion}" readonly>
                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group col-md-6">
                                                                        <label >Pago realizado</label>
                                                                        <input class="form-control" name="pagoRealizado" type="number" value="${it.paquete.precio}">
                                                                    </div>

                                                                    <div class="form-group col-md-2">
                                                                        <label >Nombre</label>
                                                                        <input class="form-control" name="nombreUsuario" value="${it.usuario.nombre}" readonly>
                                                                    </div>

                                                                    <div class="form-group col-md-2">
                                                                        <label >Apellido P</label>
                                                                        <input class="form-control" name="apellidoPaterno" value="${it.usuario.apellidoPaterno}" readonly>
                                                                    </div>

                                                                    <div class="form-group col-md-2">
                                                                        <label>Apellido M</label>
                                                                        <input class="form-control" name="apellidoMaterno" value="${it.usuario.apellidoMaterno}" readonly>
                                                                    </div>
                                                                </div>

                                                                <button type="submit" class="btn btn-danger">Pagar</button>
                                                            </g:form >
                                                        </div>
                                                        <div class="modal-footer">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--
                                            <g:form id="${it.id}" action="ticket" controller="usuario" method="post">
                                                <button type="submit" class="btn btn-danger">En adeudo</button>
                                            </g:form >

                                            -->
                                        </sec:access>
                                        <sec:access expression="hasRole('ROLE_USUARIO')">
                                            <p class="text-center">Adeudo</p>
                                        </sec:access>
                                        <sec:access expression="hasRole('ROLE_ADMIN')">
                                            <p class="text-center">Adeudo</p>
                                        </sec:access>
                                    </g:else>
                                </td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>
                </div>

                <div class="tab-pane" id="pagos">
                    <h4 class="m-y-2">Pagos realizados por: ${usuario.nombre} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}</h4>
                    <table class="table table-hover table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg" id="dataTable2">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="text-center">Id pago</th>
                            <th scope="col" class="text-center">Servicio</th>
                            <th scope="col" class="text-center">Fecha de pago</th>
                            <th scope="col" class="text-center">Fecha de aprobación</th>
                            <th scope="col" class="text-center">Monto Pagado</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${cuenta?.contratos}" var="contrato">
                            <g:each in="${contrato?.pagos}" var="pago">
                                <tr>
                                    <th scope="row" class="text-center">${pago.id}</th>
                                    <th scope="row" class="text-center">${contrato.servicio.nombre}</th>
                                    <td class="text-center">${pago.fechaPago.dateTimeString}</td>
                                    <g:if test="${pago.fechaPagoAprobado!=null}">
                                        <td class="text-center">${pago.fechaPagoAprobado.dateTimeString}</td>
                                    </g:if>
                                    <g:else>
                                    <sec:ifLoggedIn>
                                      <sec:access expression="hasRole('ROLE_ADMIN')">

                                        <g:form id="${pago.id}" action="aprobarPago" controller="usuario" method="post">
                                            <input type="hidden" name="contratoId" value="${contrato.id}">
                                            <td class="text-center"><button type="submit" class="btn btn-danger">Aprobar pago en espera</button></td>
                                        </g:form >
                                      </sec:access>

                                    <sec:access expression="hasRole('ROLE_TERMINAL')">
                                        <g:form id="${pago.id}" action="aprobarPago" controller="usuario" method="post">
                                            <td class="text-center">Pago en espera</td>
                                        </g:form >
                                      </sec:access>
                                        <sec:access expression="hasRole('ROLE_USUARIO')">
                                            <td class="text-center">Pago en espera</td>
                                        </sec:access>
                                    </sec:ifLoggedIn>
                                    </g:else>
                                    <td class="text-center">${pago.costoFinal}</td>
                                </tr>
                            </g:each>
                        </g:each>

                        </tbody>
                    </table>
                </div>


                <div class="tab-pane" id="editar">
                    <h4 class="m-y-2">Resumen de Usuario</h4>
                    <g:form resource="${this.usuario}" method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre..." value="${this.usuario?.nombre}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="apellidoPaterno">Apellido paterno</label>
                            <input type="text" class="form-control" name="apellidoPaterno" placeholder="Apellido paterno..." value="${this.usuario?.apellidoPaterno}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="apellidoMaterno">Apellido materno</label>
                            <input type="text" class="form-control" name="apellidoMaterno" placeholder="Apellido materno..." value="${this.usuario?.apellidoMaterno}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="username">Usuario</label>
                            <input type="text" class="form-control" name="username" placeholder="Usuario..." value="${this.usuario?.username}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña..." value="${this.usuario?.password}" readonly>
                        </div>

                    </g:form>
                    <g:form resource="${this.usuario}" method="DELETE">
                        <button type="button" class="btn btn-secondary text-white">
                            <g:link class="edit" action="edit" resource="${this.usuario}"><div class="text-white">Editar</div></g:link>
                        </button>
                        <input class="btn btn-danger" type="submit" value="Eliminar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}"/>
                    </g:form>

                </div>
            </div>
        </div>
        <br>
        <div class="col-lg-4 col-md-4 col-xl-4 col-sm-3"></div>
        <sec:noAccess expression="hasRole('ROLE_USUARIO')">
            <div class="col-lg-4 col-md-4 col-xl-4 col-sm-12">
                <g:form controller="usuario" action="VincularServicio" id="${this.usuario.id}">
                    <input type="submit" class="btn btn-success" value="Agregar Contrato">
                    <g:hiddenField name="idUsuario" value="" />
                </g:form>
                </div>
            <div class="col-lg-4 col-md-4 col-xl-4 col-sm-3"></div>
        </sec:noAccess>



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

    </div>
</div>
<hr>
</body>
</html>
