package mx.com.ironsoft

import grails.gorm.services.Service

@Service(TipoServicio)
interface TipoServicioService {

    TipoServicio get(Serializable id)

    List<TipoServicio> list(Map args)

    Long count()

    void delete(Serializable id)

    TipoServicio save(TipoServicio tipoServicio)

}