package mx.com.ironsoft

class Direccion {

    String calle
    String colonia
    String numeroDeCasa
    String municipio
    String estado

    static constraints = {
    }

    public String toString() {
      return calle +" " + colonia +" "+numeroDeCasa +" " + municipio+" " + estado;
    }
}
