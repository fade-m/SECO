<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>S.E.C.O</title>

    <!-- Bootstrap core CSS-->
    <asset:stylesheet src="application.css"/>


    <!-- Custom fonts for this template-->
    <asset:stylesheet src="fontawesome-free/css/all.min.css"/>
    
    <g:layoutHead/>
  </head>

  <body id="page-top" class="sidebar-toggled">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="${createLink(uri: '/')}">S.E.C.O</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

        <!-- Navbar Search -->
        <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <label class="text-white"><sec:ifLoggedIn>Bienvenido: <sec:username/></sec:ifLoggedIn></label>
        </div>


        <!-- Navbar -->
        <ul class="navbar-nav ml-auto ml-md-0">

            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle fa-fw"></i>
                </a>
                <sec:ifLoggedIn>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Cerrar sesión</a>
                    </div>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <g:link class="dropdown-item" uri="/login/auth">Iniciar sesión</g:link>
                    </div>
                </sec:ifNotLoggedIn>
            </li>
        </ul>



    </nav>
<sec:ifLoggedIn>
    <div id="wrapper">
      <!-- Sidebar -->
      <sec:access expression="hasRole('ROLE_SUPERADMIN')||hasRole('ROLE_ADMIN')">
      <ul class="sidebar navbar-nav toggled">
          <!--
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-warehouse"></i>
            <span>Terminales</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown1">
            <h6 class="dropdown-header">Opciones:</h6>
            <a class="dropdown-item" href="${createLink(uri: '/usuario/create')}">Nuevo Terminal</a>
            <a class="dropdown-item" href="${createLink(uri: '/usuario/verTerminales')}">Ver Terminales</a>
          </div>
        </li>
        -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-users"></i>
            <span>Usuarios</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown2">
            <h6 class="dropdown-header">Opciones:</h6>
            <a class="dropdown-item" href="${createLink(uri: '/usuario/create')}">Nuevo Usuario</a>
            <a class="dropdown-item" href="${createLink(uri: '/usuario/index')}">Ver Usuarios</a>
              <a class="dropdown-item" href="${createLink(uri: '/cuenta/verCuentaPagoProceso')}">Ver Usuarios con pago en proceso</a>
          </div>
        </li>
          <!--
            <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-box-open"></i>
            <span>Cuentas</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown3">
            <h6 class="dropdown-header">Opciones:</h6>
            <a class="dropdown-item" href="${createLink(uri: '/cuenta/create')}">Nuevo Cuenta</a>
            <a class="dropdown-item" href="${createLink(uri: '/cuenta/index')}">Ver Cuentas</a>
          </div>
        </li>
        -->

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-cloud"></i>
            <span>Servicios</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown4">
            <h6 class="dropdown-header">Opciones:</h6>
            <a class="dropdown-item" href="${createLink(uri: '/servicio/create')}">Nuevo Servicio</a>
            <a class="dropdown-item" href="${createLink(uri: '/servicio/index')}">Ver Servicios</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-receipt"></i>
            <span>Tipo de Servicios</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown5">
            <h6 class="dropdown-header">Opciones:</h6>
            <a class="dropdown-item" href="${createLink(uri: '/tipoServicio/create')}">Nuevo Tipo</a>
            <a class="dropdown-item" href="${createLink(uri: '/tipoServicio/index')}">Ver Tipos de Servicios</a>
          </div>
        </li>

      </ul>
    </sec:access>

         <sec:access expression="hasRole('ROLE_TERMINAL')">
         
      <ul class="sidebar navbar-nav toggled">
          <!--
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="${createLink(uri: '/pago/realizarPago')}" >
            <i class="far fa-money-bill-alt"></i>
            <span>Pagar</span>
          </a>
          
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown6" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-warehouse"></i>
            <span>Mi Terminal</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown6">
            <h6 class="dropdown-header">Opciones:</h6>
            <a class="dropdown-item" href="${createLink(uri: '/usuario/index')}">Mis Datos</a>
          </div>
        </li>
        -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown7" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-users"></i>
              <span>Mis Clientes</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown7">
              <h6 class="dropdown-header">Opciones:</h6>
              <a class="dropdown-item" href="${createLink(uri: '/usuario/create')}">Nuevo Cliente</a>
              <a class="dropdown-item" href="${createLink(uri: '/usuario/index')}">Ver Clientes</a>
        </li>
           
      </ul>
    </sec:access>

      <div id="content-wrapper">

        <div class="container-fluid">


   </sec:ifLoggedIn>
   
          <div class="container">
            <g:layoutBody />
        </div>
   <sec:ifLoggedIn>
          

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright © IronSoft 2018</span>
            </div>
          </div>
        </footer>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->
    </sec:ifLoggedIn>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro de que deseas salir?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Selecciona "Cerrar sesión" si estas listo para terminar tu sesión.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <g:form controller="logout">
                            <button type="submit" name="logout" class="btn btn-danger btn-flat">
                                Cerrar sesión
                            </button>
                        </g:form>

                    </div>
                </div>
            </div>
        </div>
        <asset:javascript src="application.js" />
  <script>
      if(!!window.performance && window.performance.navigation.type === 2)
      {
          console.log('Reloading');
          window.location.reload();
      }
  </script>
  </body>

</html>
