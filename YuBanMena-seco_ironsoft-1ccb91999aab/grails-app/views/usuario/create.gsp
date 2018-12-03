<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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


                  <g:form resource="${this.usuario}" method="POST">
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

                      <div class="form-group">
                          <label for="Rol">Rol</label>
                          <select class="form-control" name="rol">
                              <g:each in="${roles}">
                                  <option value="${it.authority}" ${rol==it.authority?"selected":""}>${it.authority}</option>
                              </g:each>
                          </select>
                      </div>

                      <nav aria-label="breadcrumb">
                          <ol class="breadcrumb">
                              <li class="breadcrumb-item">DIRECCION</li>
                          </ol>
                      </nav>
                      <div class="form-group">
                          <label for="direccion.calle">Calle</label>
                          <input type="text" class="form-control" name="direccion.calle" placeholder="Calle..." value="">
                      </div>

                      <div class="form-group">
                          <label for="direccion.colonia">Colonia</label>
                          <input type="text" class="form-control" name="direccion.colonia" placeholder="Colonia..." value="">
                      </div>

                      <div class="form-group">
                          <label for="direccion.numeroDeCasa">Numero de casa</label>
                          <input type="text" class="form-control" name="direccion.numeroDeCasa" placeholder="Numero de casa..." value="">
                      </div>

                      <div class="form-group">
                          <label for="direccion.municipio">Municipio</label>
                          <input type="text" class="form-control" name="direccion.municipio" placeholder="Municipio..." value="">
                      </div>

                      <div class="form-group">
                          <label for="direccion.estado">Estado</label>
                          <input type="text" class="form-control" name="direccion.estado" placeholder="Municipio..." value="">
                      </div>

                      <button type="submit" class="btn btn-primary">Crear</button>
                  </g:form>
              </div>
          </div>
      </div>
    </body>
</html>
