package mx.com.ironsoft

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TipoServicioServiceSpec extends Specification {

    TipoServicioService tipoServicioService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new TipoServicio(...).save(flush: true, failOnError: true)
        //new TipoServicio(...).save(flush: true, failOnError: true)
        //TipoServicio tipoServicio = new TipoServicio(...).save(flush: true, failOnError: true)
        //new TipoServicio(...).save(flush: true, failOnError: true)
        //new TipoServicio(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //tipoServicio.id
    }

    void "test get"() {
        setupData()

        expect:
        tipoServicioService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<TipoServicio> tipoServicioList = tipoServicioService.list(max: 2, offset: 2)

        then:
        tipoServicioList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        tipoServicioService.count() == 5
    }

    void "test delete"() {
        Long tipoServicioId = setupData()

        expect:
        tipoServicioService.count() == 5

        when:
        tipoServicioService.delete(tipoServicioId)
        sessionFactory.currentSession.flush()

        then:
        tipoServicioService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        TipoServicio tipoServicio = new TipoServicio()
        tipoServicioService.save(tipoServicio)

        then:
        tipoServicio.id != null
    }
}
