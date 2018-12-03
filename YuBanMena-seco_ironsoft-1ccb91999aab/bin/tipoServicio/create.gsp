<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tipoServicio.label', default: 'tipoServicio')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <h3>Crear Tipo de Servicio</h3>
                  <g:if test="${flash.message}">
                      <div class="message" role="status">${flash.message}</div>
                  </g:if>
                  <g:hasErrors bean="${this.tipoServicio}">
                      <ul class="errors" role="alert">
                          <g:eachError bean="${this.tipoServicio}" var="error">
                              <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                          </g:eachError>
                      </ul>
                  </g:hasErrors>


                  <g:form resource="${this.tipoServicio}" method="POST">
                      <div class="form-group">
                          <label for="nombre">Nombre</label>
                          <input type="text" class="form-control" name="nombre" placeholder="Nombre..." value="${this.tipoServicio?.nombre}" required>
                      </div>
                      <div class="form-group">
                          <label for="apellidoPaterno">Descripción</label>
                          <input type="text" class="form-control" name="descripcion" placeholder="Descripción..." value="${this.tipoServicio?.descripcion}" required>
                      </div>
                     
                      <button type="submit" class="btn btn-primary">Crear</button>
                  </g:form>
              </div>
          </div>
      </div>
    </body>
</html>








