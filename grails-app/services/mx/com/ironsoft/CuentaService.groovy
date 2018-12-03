package mx.com.ironsoft

import grails.gorm.services.Service

@Service(Cuenta)
interface CuentaService {

    Cuenta get(Serializable id)

    List<Cuenta> list(Map args)

    Long count()

    void delete(Serializable id)

    Cuenta save(Cuenta cuenta)

}