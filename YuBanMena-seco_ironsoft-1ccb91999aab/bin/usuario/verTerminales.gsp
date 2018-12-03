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
 <h1> VER TODAS LAS TERMINALES</h1>
    </sec:access>

      <sec:access expression="hasRole('ROLE_ADMIN')">
    <h1>  VER LAS TERMINALES</h1>
    </sec:access>

      <sec:access expression="hasRole('ROLE_TERMINAL')">
    <h1>  VER MI TERMINAL</h1>
    </sec:access>





    </body>
</html>