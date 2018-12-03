package mx.com.ironsoft
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN', 'ROLE_ADMIN'])
class TipoServicioController {

    TipoServicioService tipoServicioService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond tipoServicioService.list(params), model:[tipoServicioCount: tipoServicioService.count()]
    }

    def show(Long id) {
        respond tipoServicioService.get(id)
    }

    def create() {
        respond new TipoServicio(params)
    }

    def save(TipoServicio tipoServicio) {
        if (tipoServicio == null) {
            notFound()
            return
        }

        try {
            tipoServicioService.save(tipoServicio)
        } catch (ValidationException e) {
            respond tipoServicio.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), tipoServicio.id])
            }
            '*' { respond tipoServicio, [status: CREATED] }
        }
        redirect action:"index", method:"GET"

    }

    def edit(Long id) {
        respond tipoServicioService.get(id)
    }

    def update(TipoServicio tipoServicio) {
        if (tipoServicio == null) {
            notFound()
            return
        }

        try {
            tipoServicioService.save(tipoServicio)
        } catch (ValidationException e) {
            respond tipoServicio.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), tipoServicio.id])
            }
            '*'{ respond tipoServicio, [status: OK] }
        }
        redirect action:"index", method:"GET"
    }

    @Transactional
    def delete(TipoServicio tipoServicio) {
        if (tipoServicio == null) {
            notFound()
            return
        }
        tipoServicioService.delete(tipoServicio.id)
        System.out.print "Se borro!: " + tipoServicio.id
        redirect(action: "index")
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
