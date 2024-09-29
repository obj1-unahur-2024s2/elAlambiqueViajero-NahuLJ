import lugares.*

object luke {
    const property lugares = []
    var property vehiculo = alambiqueVeloz 
    
    method cantidadLugares() = lugares.size()

    method ultimoRecuerdo() = lugares.last().recuerdo() 

    method viajarA(unLugar) {
        if(vehiculo.puedeViajarA(unLugar)){
            vehiculo.viajarA(unLugar)
            lugares.add(unLugar)
        }
    }
}

object alambiqueVeloz {
    var combustible = 1000
    var velocidad = 70
    method combustible() = combustible

    method gastarDeCombustibleCantidad(unaCantidad){
        combustible = 0.max(combustible - unaCantidad)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        combustible += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion(self) and self.combustible() >= unLugar.combustible()

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)

    method velocidad() = velocidad

    method chocar(){
        velocidad -= 8
    }

    method realizarCarreraEn(unaCiudad){
        self.gastarDeCombustibleCantidad(unaCiudad.longitudDelCircuito() * 0.3)
    }

    method viajarA(unaCiudad){
        if(self.puedeViajarA(unaCiudad)) 
            self.gastarDeCombustibleCantidad(unaCiudad.combustible())
    }
}   

object superChatarraEspecial {
    var municion = 60000
    var velocidad = 50
    
    method combustible() = municion * 0.1

    method velocidad() = velocidad

    method hacerTrampa(){
        velocidad -= 5
    }

    method gastarDeCombustibleCantidad(unaCantidad){
        municion = 0.max(municion - unaCantidad * 10)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        municion += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion(self) and self.combustible() >= unLugar.combustible()

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)

    method realizarCarreraEn(unaCiudad){
        self.gastarDeCombustibleCantidad(unaCiudad.longitudDelCircuito() * 0.3)
    }

    method viajarA(unaCiudad){
        if(self.puedeViajarA(unaCiudad)) 
            self.gastarDeCombustibleCantidad(unaCiudad.combustible())
    }
}

object antiguallaBlindada {
    const property gangsters = ["pepe","pepita","pepona","pepe","pepote","papeto","papata"]
    var combustible = 1000
    
    method combustible() = combustible

    method velocidad() = self.largoNombresGangsters()

    method bajarGangster(unGangster) = gangsters.remove(unGangster)

    method subirGangster(unGangster) = gangsters.add(unGangster)

    method largoNombresGangsters() = gangsters.sum({gangster => gangster.length()}) 

    method gastarDeCombustibleCantidad(unaCantidad){
        combustible = 0.max(combustible - unaCantidad * 0.5)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        combustible += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion(self) and self.combustible() >= unLugar.combustible()

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)

    method realizarCarreraEn(unaCiudad){
        self.gastarDeCombustibleCantidad(unaCiudad.longitudDelCircuito() * 0.3)
    }

    method viajarA(unaCiudad){
        if(self.puedeViajarA(unaCiudad)) 
            self.gastarDeCombustibleCantidad(unaCiudad.combustible())
    }
}   

object superConvertible {
    const property convertibles = [antiguallaBlindada,alambiqueVeloz,superChatarraEspecial] 
    const combustible = 1000
    var property vehiculoActual = alambiqueVeloz

    method combustible() = combustible

    method gastarDeCombustibleCantidad(unaCantidad){
        vehiculoActual.gastarDeCombustibleCantidad(unaCantidad)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        vehiculoActual.cargarDeCombustibleCantidad(unaCantidad)
    }

    method puedeViajarA(unLugar) = vehiculoActual.puedeViajarA(unLugar)

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)

    method velocidad() = vehiculoActual.velocidad() + 5

    method realizarCarreraEn(unaCiudad){
        self.gastarDeCombustibleCantidad(unaCiudad.longitudDelCircuito() * 0.3)
    }

    method viajarA(unaCiudad){
        if(self.puedeViajarA(unaCiudad)) 
            self.gastarDeCombustibleCantidad(unaCiudad.combustible())
    }
}

//PARTE 2
object centro {
    const property inscriptos = []
    const property rechazados = []
    var property ciudad = buenosAires

    method verificarVechiculo(unVehiculo){
        if(unVehiculo.puedeInscribirseEnCiudad(ciudad)){
            inscriptos.add(unVehiculo)
        }
        else{
            rechazados.add(unVehiculo)
        }
    }

    method ciudad() = ciudad

    method reinscripcionEn(nuevaCiudad) {
        ciudad = nuevaCiudad
        self.verificarTodosLosVehiculos()
        
    }

    method verificarTodosLosVehiculos() {
        const todosLosVehiculos = inscriptos + rechazados
        inscriptos.clear()
        rechazados.clear()
        todosLosVehiculos.forEach({vehiculo => self.verificarVechiculo(vehiculo)})
    }

    method llevarALosAutosAlCircuito() {
        inscriptos.forEach({vehiculo => vehiculo.viajarA(ciudad)})
    }

    method realizarCarrera(){
        inscriptos.forEach({vehiculo => vehiculo.realizarCarreraEn(paris)})
    }

    method ganador() = inscriptos.max({vehiculo => vehiculo.velocidad()})
    
}