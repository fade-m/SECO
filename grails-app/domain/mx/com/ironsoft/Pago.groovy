package mx.com.ironsoft

class Pago implements Comparable{

    double costoInicial
    double porcentajeIronSoft
    double porcentajeEmpresario
    double costoFinal

    Date fechaPago
    Date fechaPagoAprobado

    static belongsTo = [estado : Estado]

    def calcularCostoFinalEmpresario() {

        def porcentajeEmpresario = 0.10
        def costoFinal = porcentajeEmpresario * costoInicial

        return costoFinal
    }


    def calcularCostoFinalIronSoft() {
        def porcentajeIronSoft = 0.05
        def costoFinal = porcentajeIronSoft * costoInicial
        return costoFinal
    }
     def static getCostoFinal(double costoInicial) {

        def porcentajeIronSoft = 0.05
        def porcentajeEmpresario = 0.1

        def costoFinal =  ((( porcentajeIronSoft + porcentajeEmpresario ) * costoInicial) + costoInicial)

        return costoFinal
    }
    def calcularCostoFinal() {

        def porcentajeIronSoft = 0.05
        def porcentajeEmpresario = 0.1

        def costoFinal =  ((( porcentajeIronSoft + porcentajeEmpresario ) * costoInicial) + costoInicial)

        return costoFinal
    }

    Pago(double costoInicial, Date fechaPago) {
        this.costoInicial = costoInicial
        this.fechaPago = fechaPago
        this.porcentajeIronSoft = calcularCostoFinalIronSoft()
        this.porcentajeEmpresario = calcularCostoFinalEmpresario()
        this.costoFinal = calcularCostoFinal()
        this.estado = Estado.findByNombre("Proceso")
    }
    Pago(double costoInicial, Date fechaPago, Estado estado) {
        this.costoInicial = costoInicial
        this.fechaPago = fechaPago
        this.porcentajeIronSoft = calcularCostoFinalIronSoft()
        this.porcentajeEmpresario = calcularCostoFinalEmpresario()
        this.costoFinal = calcularCostoFinal()
        this.estado = estado
    }
    static constraints = {
        fechaPagoAprobado nullable: true
        estado nullable: false
    }
    String toString(){
        return costoFinal
    }

    @Override
    int compareTo(Object o) {
        def pago=(Pago) o
        return this.fechaPago > pago.fechaPago ? -1 : (this.fechaPago < pago.fechaPago) ? 1 : 0
    }
    def isAdeudo(){
        def fechaActual = new Date()
        if(this.fechaPago.year < fechaActual.year){
            return true
        }else{
            if(this.fechaPago.year==fechaActual.year){
                if(this.fechaPago.month<fechaActual.month){
                    return true
                }else{
                    if(this.fechaPago.month == fechaActual.month){
                        if((fechaActual.date-this.fechaPago.date)>15){
                            return true
                        }else {
                            return false
                        }
                    }else{
                        return false
                    }
                }
            }else{
                return false
            }
        }
    }
}
