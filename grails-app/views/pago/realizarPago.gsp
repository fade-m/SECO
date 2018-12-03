<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.3.1.min.js"/>

    </head>
    <body>

  <sec:access expression="hasRole('ROLE_SUPERADMIN')">

    </sec:access>

      <sec:access expression="hasRole('ROLE_ADMIN')">
    
    </sec:access>

      <sec:access expression="hasRole('ROLE_TERMINAL')">
      <h1>Realizar Pago</h1>
    </sec:access>





    </body>
</html>