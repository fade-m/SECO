package mx.com.ironsoft

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN', 'ROLE_ADMIN'])
class ServicioController {

    ServicioService servicioService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond servicioService.list(params), model:[servicioCount: servicioService.count()]
    }

    def show(Long id) {
        respond servicioService.get(id)
    }

    def create() {
        def tipoServicios = TipoServicio.findAll()
        def paquetes = Paquete.findAll()
        [tipoServicios:tipoServicios,paquetes:paquetes]
    }

    def save(Servicio servicio) {
        print params
        if (servicio == null) {
            notFound()
            return
        }

        try {
            servicioService.save(servicio)
        } catch (ValidationException e) {
            respond servicio.errors, view:'create'
            return
        }
        
        redirect action:"index", method:"GET"

       
    }

    def edit(Long id) {
        respond servicioService.get(id)
    }

    def update(Servicio servicio) {
        if (servicio == null) {
            notFound()
            return
        }

        try {
            servicioService.save(servicio)
        } catch (ValidationException e) {
            respond servicio.errors, view:'edit'
            return
        }
        redirect(action: "index")

    }

    @Transactional
    def delete(Servicio servicio) {
        if (servicio == null) {
            notFound()
            return
        }

        servicioService.delete(servicio.id)
        redirect(action: "index")

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
