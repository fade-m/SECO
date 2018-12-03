package mx.com.ironsoft

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CuentaServiceSpec extends Specification {

    CuentaService cuentaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Cuenta(...).save(flush: true, failOnError: true)
        //new Cuenta(...).save(flush: true, failOnError: true)
        //Cuenta cuenta = new Cuenta(...).save(flush: true, failOnError: true)
        //new Cuenta(...).save(flush: true, failOnError: true)
        //new Cuenta(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //cuenta.id
    }

    void "test get"() {
        setupData()

        expect:
        cuentaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Cuenta> cuentaList = cuentaService.list(max: 2, offset: 2)

        then:
        cuentaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        cuentaService.count() == 5
    }

    void "test delete"() {
        Long cuentaId = setupData()

        expect:
        cuentaService.count() == 5

        when:
        cuentaService.delete(cuentaId)
        sessionFactory.currentSession.flush()

        then:
        cuentaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Cuenta cuenta = new Cuenta()
        cuentaService.save(cuenta)

        then:
        cuenta.id != null
    }
}
