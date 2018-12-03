 package mx.com.ironsoft

import java.util.Date;

 class BootStrap {

    def init = { servletContext ->

        def direccion = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion2 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion3 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion4 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion5 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion6 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion7 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )
        def direccion8 = new Direccion(
                calle: "calle1",
                colonia: "colonia1",
                numeroDeCasa: "numeroDeCasa1",
                municipio: "municipio",
                estado: "estado"
        )

//USUARIOS PARA INGRESAR

	def RoleSuperAdmin = new Rol(authority: 'ROLE_SUPERADMIN').save()
        def RoleAdmin = new Rol(authority: 'ROLE_ADMIN').save()
        def RoleTerminal = new Rol(authority: 'ROLE_TERMINAL').save()
        def RoleUsuario = new Rol(authority: 'ROLE_USUARIO').save()

		def usuarioSuperAdmin = new Usuario(
                username: 'superadmin',
                password: 'superadmin',
                direccion:direccion,
                nombre: "superadmin",
                apellidoPaterno: "superadmin",
                apellidoMaterno: "superadmin"
        ).save()

        def usuarioAdmin = new Usuario(
                username: 'admin',
                password: 'admin',
                direccion:direccion2,
                nombre: "admin",
                apellidoPaterno: "admin",
                apellidoMaterno: "admin"
        ).save()

        def usuarioTerminal = new Usuario(
                username: 'terminal',
                password: 'terminal',
                direccion:direccion3,
                nombre: "terminal",
                apellidoPaterno: "terminal",
                apellidoMaterno: "terminal"
        ).save()

        def usuarioTerminal2 = new Usuario(
                username: 'terminal2',
                password: 'terminal2',
                direccion:direccion4,
                nombre: "terminal2",
                apellidoPaterno: "termina2",
                apellidoMaterno: "terminal2"
        ).save()

        def direccionUsuarioPrueba = new Direccion(
                calle: "Yalalag",
                colonia: "Guelaguetza",
                numeroDeCasa: "4",
                municipio: "Santa María Atzompa",
                estado: "Oaxaca"
        ).save()
        def usuarioPrueba = new Usuario(
                username: 'MRHE',
                password: 'MRHE',
                direccion:direccionUsuarioPrueba,
                nombre: "Héctor Edgar",
                apellidoPaterno: "Matías",
                apellidoMaterno: "Rodríguez",
                superior: usuarioTerminal
        ).save()

        def usuarioPrueba2 = new Usuario(
                username: 'YBMZ',
                password: 'YBMZ',
                direccion:direccion5,
                nombre: "YBMZ YBMZ",
                apellidoPaterno: "YBMZ",
                apellidoMaterno: "YBMZ",
                superior: usuarioTerminal
        ).save()

        def usuarioPrueba3 = new Usuario(
                username: 'AFCH',
                password: 'AFCH',
                direccion:direccion6,
                nombre: "AFCH AFCH",
                apellidoPaterno: "AFCH",
                apellidoMaterno: "AFCH",
                superior: usuarioTerminal2
        ).save()

        UsuarioRol.create usuarioSuperAdmin, RoleSuperAdmin
        UsuarioRol.create usuarioAdmin, RoleAdmin
        UsuarioRol.create usuarioTerminal, RoleTerminal
        UsuarioRol.create usuarioTerminal2, RoleTerminal
        UsuarioRol.create usuarioPrueba, RoleUsuario
        UsuarioRol.create usuarioPrueba2, RoleUsuario
        UsuarioRol.create usuarioPrueba3, RoleUsuario


// ---------------------------------------------------------------------------------------------------
        //ESTADOS
        def estado1 = new Estado(
                nombre: "Proceso",
                descripcion: "Pago en proceso"
        ).save()
        def estado2 = new Estado(
                nombre: "Aprobado",
                descripcion: "Pago aprobado"
        ).save()
        def estado3 = new Estado(
                nombre: "Adeudo",
                descripcion: "Pago en adeudo"
        ).save()

        //TIPOS DE SERVICIO
        def tipoServicio1 = new TipoServicio(
            nombre: "Servicio de Lúz",
            descripcion: "Servicio de Luz Electrica",
            imagen: "datos de la imagen",
        ).save()

        def tipoServicio2 = new TipoServicio(
            nombre: "Servicio de telefonía",
            descripcion: "Telefonos de México",
            imagen: "datos de la imagen",
        ).save()

        def tipoServicio3 = new TipoServicio(
                nombre: "Servicio de internet",
                descripcion: "Servicio de internet en México",
                imagen: "datos de la imagen",
        ).save()

        def tipoServicio4 = new TipoServicio(
                nombre: "Servicio de televisión",
                descripcion: "Servicio de televisión en México",
                imagen: "datos de la imagen",
        ).save()


        //PAQUETES PRINCIPAL DE CFE
        def paquetesCFE = new Paquete(
                nombre: 'Paquete CFE 1000',
                descripcion: 'Paquete 1000',
                precio:1000.0
        ).save()

        def paqueteCFE1 = new Paquete(
                nombre: 'Paquete Familiar',
                descripcion: 'Descripción Paquete Familiar 100',
                precio:100.0
        ).save()

         def paqueteCFE2 = new Paquete(
                nombre: 'Paquete Comercial 200',
                descripcion: 'Descripción Paquete Comercial 200',
                precio:200.0
        ).save()



        // PAQUETE PRINCIPAL DE TELCEL
        def paquetesTelcel = new Paquete(
                nombre: 'Paquetes Telcel 100',
                descripcion: 'Descripción Paquete 100',
                precio:100.0
        ).save()


        def paqueteTelcel1 = new Paquete(
                nombre: 'Paquete 100',
                descripcion: 'Descripción Paquete 100',
                precio:100.0
        ).save()

         def paqueteTelcel2 = new Paquete(
                nombre: 'Paquete 200',
                descripcion: 'Descripción Paquete 200',
                precio:200.0
        ).save()

          def paqueteTelcel3 = new Paquete(
                nombre: 'Paquete 500',
                descripcion: 'Descripción Paquete 500',
                precio:500.0
        ).save()

        //LISTA DE PAQUETES DE CFE
        def listaCFE = new ArrayList<Paquete>()
        listaCFE.add(paqueteCFE1)
        listaCFE.add(paqueteCFE2)

        //LISTA DE PAQUETES DE TELCEL
        def listaTelcel = new ArrayList<Paquete>()
        listaTelcel.add(paqueteTelcel1)
        listaTelcel.add(paqueteTelcel2)
        listaTelcel.add(paqueteTelcel3)

        //SERVICIO DE CFE
        def servicioCFE = new Servicio(
                nombre: "CFE",
                descripcion: "Comisión Federal de Electricidad",
                imagen: "url",
                paquetes:listaCFE,
                tipoServicio: tipoServicio1
        ).save()

         def servicioTelcel = new Servicio(
                nombre: "Telcel",
                descripcion: "Telcel La Mejor Red",
                imagen: "url",
                paquetes:listaTelcel,
                tipoServicio: tipoServicio2
        ).save()

        Date fecha = new Date(117,8,8);
        Date fecha2 = new Date(117,9,30);

        //PAGOS
        def pago1 = new Pago(paquetesCFE.precio, fecha2).save()
        def pagosCFE = new ArrayList()
        pagosCFE.add(pago1)

        def pago2 = new Pago(paquetesTelcel.precio, new Date()).save()
        def pagosTelcel = new ArrayList()
        pagosTelcel.add(pago2)

        def pago3 = new Pago(paquetesCFE.precio, fecha,estado2).save()
        def pagosCFE2 = new ArrayList()
        pagosCFE2.add(pago3)

        def pago4 = new Pago(paquetesTelcel.precio, new Date(),estado2).save()
        def pagosTelcel2 = new ArrayList()
        pagosTelcel2.add(pago4)

        def pago5 = new Pago(paquetesCFE.precio, fecha,estado3).save()
        def pagosCFE3 = new ArrayList()
        pagosCFE3.add(pago5)

        def pago6 = new Pago(paquetesTelcel.precio, new Date(),estado3).save()
        def pagosTelcel3 = new ArrayList()
        pagosTelcel3.add(pago6)

        def contratoCFE = new Contrato(
                usuario: usuarioPrueba,
                servicio: servicioCFE,
                numeroDeContrato: "1234",
                fechaDeCreacion: new Date(),
                pagos: pagosCFE,
                paquete: paquetesCFE
        ).save()

          def contratoTelcel = new Contrato(
                usuario: usuarioPrueba,
                servicio: servicioTelcel,
                numeroDeContrato: "8312",
                fechaDeCreacion: new Date(),
                pagos: pagosTelcel,
                paquete: paquetesTelcel
        ).save()
        def contratoCFE2 = new Contrato(
                usuario: usuarioPrueba2,
                servicio: servicioCFE,
                numeroDeContrato: "1234",
                fechaDeCreacion: new Date(),
                pagos: pagosCFE2,
                paquete: paquetesCFE
        ).save()

        def contratoTelcel2 = new Contrato(
                usuario: usuarioPrueba2,
                servicio: servicioTelcel,
                numeroDeContrato: "8312",
                fechaDeCreacion: new Date(),
                pagos: new ArrayList<Pago>(),
                paquete: paquetesTelcel
        ).save()

        def contratoCFE3 = new Contrato(
                usuario: usuarioPrueba3,
                servicio: servicioCFE,
                numeroDeContrato: "1234",
                fechaDeCreacion: new Date(),
                pagos: pagosCFE3,
                paquete: paquetesCFE
        ).save()

        def contratoTelcel3 = new Contrato(
                usuario: usuarioPrueba3,
                servicio: servicioTelcel,
                numeroDeContrato: "8312",
                fechaDeCreacion: new Date(),
                pagos: pagosTelcel3,
                paquete: paquetesTelcel
        ).save()

        //CONTRATO
        def contratos =new ArrayList<Contrato>()
        contratos.add(contratoCFE)
        contratos.add(contratoTelcel)

        def contratos2 =new ArrayList<Contrato>()
        contratos2.add(contratoCFE2)
        contratos2.add(contratoTelcel2)

        def contratos3 =new ArrayList<Contrato>()
        contratos3.add(contratoCFE3)
        contratos3.add(contratoTelcel3)

        //CUENTA
        def cuenta =new Cuenta(
                usuario: usuarioPrueba,
                contratos: contratos
        ).save()

        def cuenta2 =new Cuenta(
                usuario: usuarioPrueba2,
                contratos: contratos2
        ).save()

        def cuenta3 =new Cuenta(
                usuario: usuarioPrueba3,
                contratos: contratos3
        ).save()




        println Usuario.count()
        UsuarioRol.withSession {
            it.flush()
            it.clear()
        }
        assert Usuario.count() == 7
        assert Rol.count() == 4
        assert UsuarioRol.count() == 7
        //assert Direccion.count() == 4






    }
    def destroy = {
    }
}
