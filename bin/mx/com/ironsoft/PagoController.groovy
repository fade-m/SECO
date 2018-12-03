package mx.com.ironsoft

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_TERMINAL'])
class PagoController {

    PagoService pagoService


    def realizarPago(){
        
    }

}
