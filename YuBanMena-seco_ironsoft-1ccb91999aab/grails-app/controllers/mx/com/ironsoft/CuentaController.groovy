package mx.com.ironsoft

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
class CuentaController {

    CuentaService cuentaService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond cuentaService.list(params), model:[cuentaCount: cuentaService.count()]
    }

    def verCuentaPagoProceso() {
        def estadoProceso= Estado.findByNombre("Proceso")
        def cuentas= Cuenta.where {
            contratos{
                pagos{
                    estado==estadoProceso
                }
            }
        }.findAll()

        def allCuentas= Cuenta.findAll()
        allCuentas.each {
            println(it.usuario)

            it.contratos.each {
                println(it.servicio)

                it.pagos.each {
                    println(it.estado)
                }
            }
        }
        println(cuentas.size())
        [estadoProceso:estadoProceso, cuentas:cuentas]
    }

    def show(Long id) {
        respond cuentaService.get(id)
    }

    def create() {
        respond new Cuenta(params)
    }

    def save(Cuenta cuenta) {
        if (cuenta == null) {
            notFound()
            return
        }

        try {
            cuentaService.save(cuenta)
        } catch (ValidationException e) {
            respond cuenta.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cuenta.label', default: 'Cuenta'), cuenta.id])
                redirect cuenta
            }
            '*' { respond cuenta, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond cuentaService.get(id)
    }

    def update(Cuenta cuenta) {
        if (cuenta == null) {
            notFound()
            return
        }

        try {
            cuentaService.save(cuenta)
        } catch (ValidationException e) {
            respond cuenta.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cuenta.label', default: 'Cuenta'), cuenta.id])
                redirect cuenta
            }
            '*'{ respond cuenta, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        cuentaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'cuenta.label', default: 'Cuenta'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuenta.label', default: 'Cuenta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
