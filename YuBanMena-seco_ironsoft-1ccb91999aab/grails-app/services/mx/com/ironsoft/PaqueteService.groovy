package mx.com.ironsoft

import grails.gorm.services.Service

@Service(Paquete)
interface PaqueteService {

    Paquete get(Serializable id)

    List<Paquete> list(Map args)

    Long count()

    void delete(Serializable id)

    Paquete save(Paquete paquete)

}