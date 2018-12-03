package mx.com.ironsoft

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_TERMINAL', 'ROLE_USUARIO'])
class UsuarioController {

    UsuarioService usuarioService

    static allowedMethods = [ticket: 'POST']

    @Secured(['ROLE_USUARIO', 'ROLE_SUPERADMIN', 'ROLE_ADMIN', 'ROLE_TERMINAL'])
    def loggedIn () {
        def usuarioRol = UsuarioRol.findByUsuario(getAuthenticatedUser())
        println(usuarioRol.rol.authority)
        if(usuarioRol.rol.authority=="ROLE_USUARIO"){
            redirect(action: "show", params: [id:usuarioRol.usuario.id])
        }else{
            redirect(uri: "/")
        }
    }
    def index(Integer max) {

        def terminalesDisponibles = []
        params.max = Math.min(max ?: 10, 100)

        if (isLoggedIn()) {
         def usr = getAuthenticatedUser()
         def queryTipoRol = UsuarioRol.where{usuario==usr}


         if(queryTipoRol.list().rol.authority.toString() == '[ROLE_SUPERADMIN]') {
           terminalesDisponibles = getTerminales()
         }else if(queryTipoRol.list().rol.authority.toString() == '[ROLE_ADMIN]') {
           terminalesDisponibles = getTerminales()
         }else if(queryTipoRol.list().rol.authority.toString() == '[ROLE_TERMINAL]') {
           println "terminal logeada:" + usr.find()
           terminalesDisponibles.add usr.find()

         } else if (queryTipoRol.list().rol.authority.toString() == '[ROLE_USUARIO]'){
             redirect(action: "show", params: [id:queryTipoRol.find().usuario.id])
         }
        }
        respond usuarioService.list(params), model:[usuarioCount: usuarioService.count(), terminales:terminalesDisponibles]
    }

    def obtenerUltimosMovimientos(ArrayList<Contrato> contratos){
        def pagos = new ArrayList<Pago>()
        contratos.each {
            println(it.pagos.size())
            it.pagos.each { pago->
                pagos.add(pago)
            }
        }
        pagos.sort()
        println pagos.size()+" "+ pagos.fechaPago
        return pagos
    }
    def show(Long id) {
        def usuario = Usuario.findById(id)
        def servicios = Servicio.findAll()
        def cuenta = Cuenta.findByUsuario(usuario)
        println("NumContratos: "+cuenta.contratos.size())
        [usuario:usuario,servicios:servicios, cuenta: cuenta, ultimosPagos: obtenerUltimosMovimientos(cuenta.contratos.toList())]
    }

    def VincularServicio(Long id){

        //ENCONTRAR USUARIO CON ID
        def usuario = Usuario.findById(id)
        //ENCONTRAR CUENTA DEL USUARIO
        def cuentaUsuario = Cuenta.findByUsuario(usuario)
        //TRAER TODOS LOS SERVICIOS DE LA BASE
        def contratos = Contrato.where {
            usuario == usuario
        }.list()
        def allServicios = Servicio.findAll()
        //def serviciosUsuario = Servicio.findAllByUsuario(usuario)
        [allServicios: allServicios,usuario:usuario,cuentaUsuario:cuentaUsuario,contratos:contratos]
    }


    def verTerminales(){

    }

    def aprobarPago() {
      def p = Pago.where{id==params.id}
      def pago = p.find()
      def e = Estado.where{nombre=='Aprobado'}
      def estado = e.find()
      def c = Contrato.where{id==params.contratoId}
      def contrato = c.find()
      def usuario = contrato.usuario

      pago.fechaPagoAprobado = new Date()
      pago.estado = estado
      pago.save(flush:true)

      redirect (uri: "/usuario/show/"+usuario.id)
    }


    def ticket() {
        def numContrato = params.numeroDeContrato
        def fechaCreacion = params.fechaDeCreacion
        def servicio = params.servicio
        def descripcionDelServicio = params.descripcionDelServicio
        def paquete = params.paquete
        def descripcionDelPaquete = params.descripcionDelPaquete
        def pago = params.pagoRealizado
        def nombreUsuario = params.nombreUsuario
        def apellidoPaterno = params.apellidoPaterno
        def apellidoMaterno = params.apellidoMaterno
        def usuario = Usuario.findById(params.idUsuario)
        println("***********"+usuario.toString())
        def contrato = Contrato.findById(params.idContrato)
        Pago nuevoPago = new Pago(Double.parseDouble(pago), new Date()).save(flush:true)
        contrato.pagos.add(nuevoPago)
        if(contrato.save(flush:true)){
            contrato.errors.each {
                println(it)
            }
        }
        def datos = [
                numeroDeContrato: numContrato,
                fechaDeCreacion: new Date(),
                servicio: servicio,
                servicioDescripcion:descripcionDelServicio,
                paquete:paquete,
                paqueteDescripcion: descripcionDelPaquete,
                pagoRealizado:nuevoPago.costoFinal,
                usuarioNombre:nombreUsuario,
                usuarioApellidoP: apellidoPaterno,
                usuarioApellidoM:  apellidoMaterno,
                usuario: usuario
        ]
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Pago Realizado"
        flash.message = "Se ha realizado el pago correctamente"

          [datosPago:datos]
    }


    def getTerminales() {
      def terminales = []
      for (e in Usuario.findAll()) {
        if(e.getAuthorities().authority.toString() == '[ROLE_TERMINAL]')
        terminales.add e
      }
      return terminales
    }

    def create() {
      def allRoles
      def usr
      def usuario
      if (isLoggedIn()) {
       usr = getAuthenticatedUser()
       usuario = usr.find()
       def queryTipoRol = UsuarioRol.where{usuario==usr}

       if(queryTipoRol.list().rol.authority.toString() == '[ROLE_TERMINAL]') {
         def query = Rol.where{authority=='ROLE_USUARIO'}
         allRoles = query.find()
       }else {
         allRoles = Rol.findAll()
       }
      }
      respond new Usuario(params), model:['roles':allRoles, usuarioLogeado: usuario.username]
    }

    def save(Usuario usuario) {
      def superior
        if (usuario == null) {
            notFound()
            return
        }
        try {
          if (isLoggedIn()) {
           def usr = getAuthenticatedUser()
           def queryTipoRol = UsuarioRol.where{usuario==usr}

           if(queryTipoRol.list().rol.authority.toString() == '[ROLE_SUPERADMIN]') {
             usuario.superior = null
           }else if(queryTipoRol.list().rol.authority.toString() == '[ROLE_ADMIN]') {
             usuario.superior = null
           }else if(queryTipoRol.list().rol.authority.toString() == '[ROLE_TERMINAL]') {
             usuario.superior = usr.find()
           }
           usuarioService.save(usuario)
           def queryRol = Rol.where{authority==params.rol}
           Rol rol = queryRol.find()
           UsuarioRol.create(usuario,rol,true)
          }
        } catch (ValidationException e) {
            respond usuario.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*' { respond usuario, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond usuarioService.get(id)
    }

    def update(Usuario usuario) {
        if (usuario == null) {
            notFound()
            return
        }

        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*'{ respond usuario, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        def usuario = Usuario.where{id==id}.find()
        def usuarioRol = UsuarioRol.where{usuario==usuario}.find()
        def contratos = Contrato.where{usuario==usuario}.findAll()
        def cuenta = Cuenta.findByUsuario(usuario)

        //cuenta?.contratos?.clear()

        cuenta?.contratos?.each {
            it.usuario=null
            it.servicio=null
            it.paquete=null
            it.pagos.each {
                it.estado=null
                it.save()
                it.delete()
            }
            it.pagos=null
            it.save()
            it.delete()
        }

        cuenta?.contratos=null
        cuenta?.save(flush:true)
        cuenta?.delete(flush:true)

        usuarioRol?.delete(flush:true)
        //usuario.direccion.delete(flush: true)
        usuario?.superior=null
        usuario?.direccion?.delete()
        usuario?.direccion=null
        usuario?.save(flush:true)
        println(usuario)
        usuario?.delete(flush: true)


        //cuenta.delete(flush:true)
        //contrato.delete()
        //UsuarioRol.removeAll(u)
        //usuarioService.delete(id)
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Usuario Eliminado"
        flash.message = "Se ha eliminado el usuario correctamente"
        redirect(action: "index")
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
