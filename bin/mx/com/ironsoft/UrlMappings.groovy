package mx.com.ironsoft

class UrlMappings {

    static mappings = {


        group "/tipoServicio", {
            "/delete/$id" (controller: "tipoServicio", action: "delete")
        }



        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
