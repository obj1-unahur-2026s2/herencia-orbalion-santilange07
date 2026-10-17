class Equipos{
    const nombre 
    const nivelDeEnergiaBase
    const entrenador
    const tecnologias = []
    method energiaTotal(){
        return nivelDeEnergiaBase + tecnologias.sum({t=>t.valorEnergetico()})
    }
}

class Luminico inherits Equipos{
    const nivelDeRadiacionCapturada
    const nombresDeCristales = []
    override method energiaTotal(){
        if (nivelDeRadiacionCapturada<5000){
            return super() * 1.10
        }
        else{
            return super()
        }
    }
}

class Sinteticos inherits Equipos{
    const nivelDeRadiacionCapturada 
    const cantidadDeModulosActivos
    const estanCertificados 
    override method energiaTotal(){
        if (cantidadDeModulosActivos>5){
            return super()*0.20
        }
        else{
            return super()
        }
    }
}

class Etericos inherits Equipos{
    const nivelDeFluctuacionDimensional
    const cantidadDePortalesEnergeticosAbiertos
}

class Entrenador{
    const cantiadadDeCiclosSolaresDeExperiencia
    const estaEnSintonia
    const nivelDePrecisionEstrategica
    const listaDeRolesHomologados = ["estrategaCuantico","arquitectoDeEnergia","guiaMental"]
    var rol 
    method asignarRol(nuevoRol){
        if(!listaDeRolesHomologados.contains(nuevoRol)){
            self.error("Rol no homologado por la FOZ")
        }
        else{
        rol = nuevoRol
    }
    }
}


class TecnologiasEspeciales{
    const nombre
    const valorEnergetico
    var activa = true
    method valorEnergetico()= if(activa){valorEnergetico} else {0}
}