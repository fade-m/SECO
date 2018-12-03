package mx.com.ironsoft

import grails.gorm.services.Service

@Service(Pago)
interface PagoService {

    Pago get(Serializable id)

    List<Pago> list(Map args)

    Long count()

    void delete(Serializable id)

    Pago save(Pago pago)

}