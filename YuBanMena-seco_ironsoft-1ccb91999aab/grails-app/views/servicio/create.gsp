<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'servicio')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <h3>Crear Servicio</h3>
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


                  <g:form controller="servicio" action="save" method="POST">
                      <div class="form-group">
                          <label for="nombre">Nombre</label>
                          <input type="text" class="form-control" name="nombre" placeholder="Nombre..." value="${this.servicio?.nombre}" required>
                      </div>
                      <div class="form-group">
                          <label for="descripcion">Descripción</label>
                          <input type="text" class="form-control" name="descripcion" placeholder="Descripción..." value="${this.servicio?.descripcion}" required>
                      </div>
                      <div class="form-group">
                          <label for="imagen">Imagen</label>
                          <input type="text" class="form-control" name="imagen" placeholder="Imagen..." value="${this.servicio?.imagen}" required>
                      </div>
                      <div class="form-group">
                        <label for="tipoServicio">Tipo de Servicio</label>
                            <select class="form-control" id="tipoServicio" name="tipoServicio">
                            <g:each in="${tipoServicios}">
                                <option value="${it.id}" id="tipoServicio">${it}</option>
                            </g:each>
                            </select>
                        </div>

                    <div class="form-group">
                        <label for="paquete">Paquete</label>
                            <select class="form-control" id="paquetes" name="paquetes">
                            <g:each in="${paquetes}">
                                <option value="${it.id}">${it}</option>
                            </g:each>
                            </select>
                    </div>
                      <button type="submit" class="btn btn-primary">Crear</button>
                      <br>
                  </g:form>
              </div>
          </div>
      </div>
    </body>
</html>

