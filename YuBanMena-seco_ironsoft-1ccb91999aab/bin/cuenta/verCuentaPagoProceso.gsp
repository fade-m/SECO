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
        <h3>Lista de usuarios con estado en proceso</h3>
        <div class="col-12">
            <table class="table table-hover table-responsive-xl table-responsive-md table-responsive-sm table-responsive-lg" id="dataTable1">
                <thead class="thead-dark">
                <tr>
                    <th scope="col" class="text-center">Usuario</th>
                    <th scope="col" class="text-center">Servicios</th>
                    <th scope="col" class="text-center">Opciones</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${cuentas}">
                    <tr>
                        <th scope="row" class="text-center">${it.usuario.toString()}</th>
                        <td class="text-center">
                            <g:each in="${it.contratos}">
                                ${it.servicio}
                            </g:each>
                        </td>
                        <td class="text-center">
                            <g:link controller="usuario" class="text-white btn btn-info" action="show" id="${it.usuario.id}">
                                Ver Detalle
                            </g:link>
                        </td>
                    </tr>
                </g:each>


                </tbody>
            </table>
        </div>
    </div>
</div>
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
</script>
</body>
</html>
