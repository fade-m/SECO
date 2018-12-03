<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'servicio')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
            <div class="row">
                <div class="col-12">
                    <h3>Editar Servicio</h3>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.servicio}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.servicio}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:form resource="${this.servicio}" method="PUT">
                      <div class="form-group">
                          <label for="nombre">Nombre</label>
                          <input type="text" class="form-control" name="nombre" placeholder="Nombre..." value="${this.servicio?.nombre}" required>
                      </div>
                      <div class="form-group">
                          <label for="descipcion">Descripción</label>
                          <input type="text" class="form-control" name="descripcion" placeholder="Descripción..." value="${this.servicio?.descripcion}" required>
                      </div>
                      <div class="form-group">
                          <label for="imagen">Imagen</label>
                          <input type="text" class="form-control" name="imagen" placeholder="Imagen..." value="${this.servicio?.imagen}" required>
                      </div>
                      <button type="submit" class="btn btn-primary">Editar</button>
                  </g:form>
                </div>
            </div>
        </div>
    </body>
</html>