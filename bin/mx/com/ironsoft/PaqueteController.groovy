package mx.com.ironsoft

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN', 'ROLE_ADMIN'])
class PaqueteController {

    PaqueteService paqueteService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond paqueteService.list(params), model:[paqueteCount: paqueteService.count()]
    }

    def show(Long id) {
        respond paqueteService.get(id)
    }

    def create() {
        respond new Paquete(params)
    }

    def save(Paquete paquete) {
        if (paquete == null) {
            notFound()
            return
        }

        try {
            paqueteService.save(paquete)
        } catch (ValidationException e) {
            respond paquete.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'paquete.label', default: 'Paquete'), paquete.id])
                redirect paquete
            }
            '*' { respond paquete, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond paqueteService.get(id)
    }

    def update(Paquete paquete) {
        if (paquete == null) {
            notFound()
            return
        }

        try {
            paqueteService.save(paquete)
        } catch (ValidationException e) {
            respond paquete.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'paquete.label', default: 'Paquete'), paquete.id])
                redirect paquete
            }
            '*'{ respond paquete, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        paqueteService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'paquete.label', default: 'Paquete'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
