<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
            <div class="row">
                <div class="col-12">
                    <h3>Editar Tipo de Servicio</h3>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:form resource="${this.tipoServicio}" method="PUT">
                      <div class="form-group">
                          <label for="nombre">Nombre</label>
                          <input type="text" class="form-control" name="nombre" placeholder="Nombre..." value="${this.tipoServicio?.nombre}" required>
                      </div>
                      <div class="form-group">
                          <label for="descripcion">Descripción</label>
                          <input type="text" class="form-control" name="descripcion" placeholder="Descripción..." value="${this.tipoServicio?.descripcion}" required>
                      </div>
                     
                      <button type="submit" class="btn btn-primary">Editar</button>
                  </g:form>
                </div>
            </div>
        </div>
    </body>
</html>