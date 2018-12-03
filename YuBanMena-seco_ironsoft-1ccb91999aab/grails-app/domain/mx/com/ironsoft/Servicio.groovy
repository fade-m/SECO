package mx.com.ironsoft

class Servicio {

    String nombre
    String descripcion
    String imagen

    static hasMany = [paquetes : Paquete]
    static belongsTo = [tipoServicio: TipoServicio]

    static constraints = {
        tipoServicio nullable: false
        paquetes nullable: true
    }


    String toString() {
      return nombre
    }
}
