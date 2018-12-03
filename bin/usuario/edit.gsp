<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.usuario}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.usuario}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:form resource="${this.usuario}" method="PUT">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre..." value="${this.usuario?.nombre}" required>
                        </div>
                        <div class="form-group">
                            <label for="apellidoPaterno">Apellido paterno</label>
                            <input type="text" class="form-control" name="apellidoPaterno" placeholder="Apellido paterno..." value="${this.usuario?.apellidoPaterno}" required>
                        </div>
                        <div class="form-group">
                            <label for="apellidoMaterno">Apellido materno</label>
                            <input type="text" class="form-control" name="apellidoMaterno" placeholder="Apellido materno..." value="${this.usuario?.apellidoMaterno}" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Usuario</label>
                            <input type="text" class="form-control" name="username" placeholder="Usuario..." value="${this.usuario?.username}" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña..." value="${this.usuario?.password}" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Editar</button>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
