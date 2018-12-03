<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>S.E.C.O</title>
</head>
<body>

<h3><sec:ifLoggedIn>Bienvenido:<i> <sec:username/></i></sec:ifLoggedIn></h3>




<sec:ifNotLoggedIn>
    Inicia Sesión
    <li class="dropdown user user-menu">
        <g:link class="btn text-blue" uri="/login/auth">Iniciar sesión</g:link>
    </li>
</sec:ifNotLoggedIn>

<div class="row">
<sec:ifLoggedIn>
    <sec:access expression="hasRole('ROLE_SUPERADMIN')||hasRole('ROLE_ADMIN')">
        <!--
      <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #ff5248">
      <div class="card-header text-center">
      <div class="w-100 text-center">
                    <asset:image src="store.png" height="auto" class="d-inline-block align-top" />
      </div>
      </div>

      <div class="card-body">
        <h5 class="card-title text-center">Terminales</h5>
        <p class="card-text text-center">Visualiza,Consulta, Crea o Edita de una<br><strong>Terminal</strong> </p>
      </div>
      <div class="card-footer">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/usuario/verTerminales/"> Entrar</g:link>
      </div>
    </div>
    </div>
-->
    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #45B39D">
      <div class="card-header text-center">
      <div class="w-100 text-center">
                    <asset:image src="customer.png" height="auto" class="d-inline-block align-top" />
      </div>
    </div>
      <div class="card-body">
        <h5 class="card-title text-center">Usuarios</h5>
        <p class="card-text text-center">Visualiza, Consulta, Crea o Edita datos de <br><strong>Usuarios</strong></p>

      </div>
      <div class="card-footer">
        <small class="text-muted">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/usuario/index">Entrar</g:link>
    
        
        </small>
      </div>
    </div>
    </div>
   <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #578be1">
      <div class="card-header text-center">
            <div class="w-100 text-center">
                          <asset:image src="services.png" height="auto" class="d-inline-block align-top" />
            </div>
      </div>
      <div class="card-body">
        <h5 class="card-title text-center">Servicios</h5>
        <p class="card-text text-center">Visualiza, Consulta, Crea o Edita datos de  <br><strong>Servicio</strong></p>
      </div>

      <div class="card-footer">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/servicio/index">Entrar</g:link>
      </div>
    </div>
    </div>
        <!--
   <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #A569BD">
      <div class="card-header text-center">
            <div class="w-100 text-center">
              <asset:image src="customer.png" height="auto" class="d-inline-block align-top" />
            </div>
      </div>
      <div class="card-body">
        <h5 class="card-title text-center">Cuentas</h5>
        <p class="card-text text-center">Visualiza, Consulta, Crea o Edita datos de  <br><strong>Cuentas</strong></p>
      </div>

      <div class="card-footer">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/cuenta/index">Entrar</g:link>
      </div>
    </div>
    </div>
    -->
    
<div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #cca902">
      <div class="card-header text-center">
            <div class="w-100 text-center">
                          <asset:image src="type.png" height="auto" class="d-inline-block align-top" />
            </div>
      </div>
      <div class="card-body">
        <h5 class="card-title text-center">Tipo de Servicios</h5>
        <p class="card-text text-center">Consulta, Visualiza, Crea Y Edita <br><strong>Tipos de Servicio</strong></p>
      </div>

      <div class="card-footer">
        <small class="text-muted">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/tipoServicio/index">Entrar</g:link>
        </small>
      </div>
    </div>
    </div>
</div>
  
    </sec:access>
    <sec:access expression="hasRole('ROLE_ADMIN')">
    </sec:access>
    <sec:access expression="hasRole('ROLE_USUARIO')">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="card text-white mb-3" style="background-color: #45B39D">
                <div class="card-header text-center">
                    <div class="w-100 text-center">
                        <asset:image src="customer.png" height="auto" class="d-inline-block align-top" />
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="card-title text-center">Mi Cuenta</h5>
                    <p class="card-text text-center">Consulta y Visualiza, los datos de tu cuenta</p>
                </div>
                <div class="card-footer">
                    <g:link class="btn btn-outline-white text-white container-fluid" uri="/usuario/index">Entrar</g:link>
                </div>
            </div>
        </div>
    </sec:access>
    <sec:access expression="hasRole('ROLE_TERMINAL')"><!--
       <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #f7932f">
      <div class="card-header text-center">
            <div class="w-100 text-center">
                          <asset:image src="money.png" height="auto" class="d-inline-block align-top" />
            </div>
      </div>

      <div class="card-body">
        <h5 class="card-title text-center">Pagar Servicio</h5>
        <p class="card-text text-center">Realiza el Pago del Servicio de un Cliente</p>
      </div>

      <div class="card-footer">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/pago/realizarPago/"> Entrar</g:link>
      </div>
    </div>
    </div>
    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
    <div class="card text-white mb-3" style="background-color: #ff5248">
      <div class="card-header text-center">
      <div class="w-100 text-center">
                    <asset:image src="store.png" height="auto" class="d-inline-block align-top" />
      </div>
      </div>


      <div class="card-body">
        <h5 class="card-title text-center">Mi terminal</h5>
        <p class="card-text text-center">Consulta y Visualiza datos de tu Terminal </p>

      </div>
      <div class="card-footer">
        <small class="text-muted">
        <g:link class="btn btn-outline-white text-white container-fluid" uri="/usuario/verTerminales/"> Entrar</g:link>
        </small>
      </div>
    </div>
    </div>
-->
    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        <div class="card text-white mb-3" style="background-color: #45B39D">
            <div class="card-header text-center">
                <div class="w-100 text-center">
                    <asset:image src="customer.png" height="auto" class="d-inline-block align-top" />
                </div>
            </div>
            <div class="card-body">
                <h5 class="card-title text-center">Mis Clientes</h5>
                <p class="card-text text-center">Consulta y Visualiza, Crea o Edita datos de Mi Clientes</p>
            </div>
            <div class="card-footer">
                <g:link class="btn btn-outline-white text-white container-fluid" uri="/usuario/index">Entrar</g:link>
            </div>
        </div>
    </div>
    </sec:access>
</sec:ifLoggedIn>


</body>
</html>
