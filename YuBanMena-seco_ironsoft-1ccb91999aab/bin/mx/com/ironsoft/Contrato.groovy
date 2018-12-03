package mx.com.ironsoft

//vinculacion entre servicios y cliente

class Contrato {

    String numeroDeContrato
    Date fechaDeCreacion
    boolean isPrecioFiijo

    static belongsTo = [usuario: Usuario, servicio: Servicio, paquete: Paquete]

    static hasMany = [pagos: Pago]
    static constraints = {
        usuario nullable: false
        pagos nullable: false
    }

    @Override
    public String toString() {
        return "Contrato{" +
                "id=" + id +
                ", numeroDeContrato='" + numeroDeContrato + '\'' +
                ", fechaDeCreacion=" + fechaDeCreacion +
                ", isPrecioFiijo=" + isPrecioFiijo +
                ", usuario=" + usuario +
                ", servicio=" + servicio +
                ", paquete=" + paquete +
                '}';
    }
}
