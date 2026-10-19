class Equipos{
    const nombre 
    const nivelDeEnergiaBase
    const entrenador
    const tecnologias = []
    method energiaTotal(){
    return nivelDeEnergiaBase + tecnologias.filter({t=>t.activa()}).sum({t=>t.valorEnergetico()})
    }
    method agregarTecnologias(tecnologiaNueva){
        tecnologias.add(tecnologiaNueva)
    }
    method sacarTecnologia(tecnologia){
        tecnologias.remove(tecnologia)
    }
    method entrenador()=entrenador
    method nombre()=nombre
    method esDePrestigioUniversal()
}

class Luminico inherits Equipos{
    const nivelDeRadiacionCapturada
    const cristales = []
    method agregarCristal(cristal){
        cristales.add(cristal)
    }
    override method energiaTotal(){
        if (nivelDeRadiacionCapturada<5000){
            return super() * 1.10
        }
        else{
            return super()
        }
    }
    override method esDePrestigioUniversal(){
        return cristales.size()>=3 and self.entrenador().esDeEliteGalactica() and tecnologias.size()>=1
    }
}

class Sinteticos inherits Equipos{
    const nivelDeRadiacionCapturada 
    const modulosActivos
    const estanCertificados 
    override method energiaTotal(){
        if (modulosActivos>5){
            return super()*0.80
        }
        else{
            return super()
        }
    }
    method estanCertificados()=estanCertificados
    method nivelDeRadiacionCapturada()= nivelDeRadiacionCapturada
    override method esDePrestigioUniversal(){
        return self.estanCertificados() and modulosActivos >3 and tecnologias.all({t=>t.activa()})
    }
}

class Etericos inherits Equipos{
    const fluctuacion
    const portalesEnergeticosAbiertos
    method fluctuacionl()=fluctuacion
    method cantidadDePortalesEnergeticosAbiertos()=portalesEnergeticosAbiertos
    override method esDePrestigioUniversal(){
        return fluctuacion > 75 and portalesEnergeticosAbiertos >= 2 and tecnologias.filter({t=>t.activa()}).size()>=2
    }
    override method energiaTotal(){
        if(self.esDePrestigioUniversal()){
         return super()*1.15
        }
        else{
          return  super()
        }
    }
}

class Entrenador{
    const ciclos
    const estaEnSintonia
    const nivelDePrecisionEstrategica
    const listaDeRolesHomologados = [estrategaCuantico,arquitectoDeEnergia,guiaMental]
    var rol 
    method asignarRol(nuevoRol){
        if(!listaDeRolesHomologados.contains(nuevoRol)){
            self.error("Rol no homologado por la FOZ")
        }
        else{
        rol = nuevoRol
    }
    }
    method cantiadadDeCiclosSolaresDeExperiencia()=ciclos
    method estaEnSintonia()=estaEnSintonia
    method nivelDePrecisionEstrategica()=nivelDePrecisionEstrategica
    method esDeEliteGalactica(){
        return ciclos>10 and rol.esDeEliteGalactica(self)
    }
}

object estrategaCuantico{
    method esDeEliteGalactica(entrenador){
        return entrenador.nivelDePrecisionEstrategica()>80
    }
}

object arquitectoDeEnergia{
    method esDeEliteGalactica(entrenador){
        return entrenador.estaEnSintonia()
    }
}

object guiaMental{
    method esDeEliteGalactica(entrenador){
        return true
    }
}


class TecnologiasEspeciales{
    const nombre
    const valorEnergetico
    const activa 
    method valorEnergetico()= if(activa){valorEnergetico} else{0}
    method nombre()=nombre
    method activa()=activa
}

const tecnologia1 = new TecnologiasEspeciales(nombre= "nucleos" ,valorEnergetico = 10, activa =true)