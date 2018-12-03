package mx.com.ironsoft



class Cuenta {
    static belongsTo = [usuario: Usuario]
    static hasMany = [contratos : Contrato]

    static constraints = {
        usuario nullable: false
        contratos nullable: true
    }

    @Override
    String toString() {
        return usuario.toString()+ " "+ contratos
    }
}
