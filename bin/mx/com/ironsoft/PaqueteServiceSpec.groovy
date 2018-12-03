package mx.com.ironsoft

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PaqueteServiceSpec extends Specification {

    PaqueteService paqueteService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Paquete(...).save(flush: true, failOnError: true)
        //new Paquete(...).save(flush: true, failOnError: true)
        //Paquete paquete = new Paquete(...).save(flush: true, failOnError: true)
        //new Paquete(...).save(flush: true, failOnError: true)
        //new Paquete(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //paquete.id
    }

    void "test get"() {
        setupData()

        expect:
        paqueteService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Paquete> paqueteList = paqueteService.list(max: 2, offset: 2)

        then:
        paqueteList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        paqueteService.count() == 5
    }

    void "test delete"() {
        Long paqueteId = setupData()

        expect:
        paqueteService.count() == 5

        when:
        paqueteService.delete(paqueteId)
        sessionFactory.currentSession.flush()

        then:
        paqueteService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Paquete paquete = new Paquete()
        paqueteService.save(paquete)

        then:
        paquete.id != null
    }
}
