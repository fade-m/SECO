package mx.com.ironsoft

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PagoServiceSpec extends Specification {

    PagoService pagoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Pago(...).save(flush: true, failOnError: true)
        //new Pago(...).save(flush: true, failOnError: true)
        //Pago pago = new Pago(...).save(flush: true, failOnError: true)
        //new Pago(...).save(flush: true, failOnError: true)
        //new Pago(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //pago.id
    }

    void "test get"() {
        setupData()

        expect:
        pagoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Pago> pagoList = pagoService.list(max: 2, offset: 2)

        then:
        pagoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        pagoService.count() == 5
    }

    void "test delete"() {
        Long pagoId = setupData()

        expect:
        pagoService.count() == 5

        when:
        pagoService.delete(pagoId)
        sessionFactory.currentSession.flush()

        then:
        pagoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Pago pago = new Pago()
        pagoService.save(pago)

        then:
        pago.id != null
    }
}
