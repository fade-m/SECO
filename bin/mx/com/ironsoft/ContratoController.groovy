package mx.com.ironsoft

import java.io.*
import java.util.*

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_TERMINAL'])
class ContratoController {

    ContratoService contratoService

   def contratar(Long id){
      
        Date today = Calendar.getInstance().getTime()
        def usuario = Usuario.findById(id)
        def cuenta = Cuenta.findByUsuario(usuario)
        def servicio = Servicio.findById(params.servicio.id)

        boolean isPrecioFiijo = false
        String isPrecioFijo = params.isPrecioFiijo
        
        if(isPrecioFijo.equals('on')){
            isPrecioFiijo=true
        }
       def pagos = new ArrayList()

        def contrato = new Contrato(
                usuario: usuario,
                servicio: servicio,
                numeroDeContrato: params.numeroDeContrato,
                isPrecioFiijo:isPrecioFiijo,
                fechaDeCreacion: new Date(),
                pagos: new ArrayList<Pago>(),
                paquete: params.paquete
        ).save()

        //AGREGAR CONTRATO A LA CUENTA
        cuenta.contratos.add(contrato)

        if (cuenta.save(flush:true)) {
            println "Contrato vinculado a la cuenta!"
        }
        redirect(uri: "/usuario/vincularServicio/"+id+"")
    }




    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond contratoService.list(params), model:[contratoCount: contratoService.count()]
    }

    def show(Long id) {
        respond contratoService.get(id)
    }

    def create() {
        respond new Contrato(params)
    }

    def save(Contrato contrato) {
        if (contrato == null) {
            notFound()
            return
        }

        try {
            contratoService.save(contrato)
        } catch (ValidationException e) {
            respond contrato.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contrato.label', default: 'Contrato'), contrato.id])
                redirect contrato
            }
            '*' { respond contrato, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond contratoService.get(id)
    }

    def update(Contrato contrato) {
        if (contrato == null) {
            notFound()
            return
        }

        try {
            contratoService.save(contrato)
        } catch (ValidationException e) {
            respond contrato.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contrato.label', default: 'Contrato'), contrato.id])
                redirect contrato
            }
            '*'{ respond contrato, [status: OK] }
        }
    }


    @Transactional
    def delete(Contrato contrato) {
        if (contrato == null) {
            notFound()
            return
        }

        def usuario =Usuario.findById(contrato.usuario.id)
        def cuenta = Cuenta.findByUsuario(usuario)

        //SE DESVINCULA DE LA TABLA CUENTA
        //PARA QUE NO DE ESO DE REFERENCIAL
        cuenta.removeFromContratos(contrato)
        if(cuenta.save()){
            println "Contrato borrado de la cuenta!"
        }

        //SE BORRA EL CONTRATO
        contratoService.delete(contrato.id)


        println usuario
        println cuenta
        println contrato

        redirect(uri: "/usuario/vincularServicio/"+usuario.id+"")
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrato.label', default: 'Contrato'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
