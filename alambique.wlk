import lugares.*

object luke {
    const property lugares = []
    var property vehiculo = alambiqueVeloz 
    
    method cantidadLugares() = lugares.size()

    method ultimoRecuerdo() = lugares.last().recuerdo() 

    method viajarA(unLugar) {
        if(vehiculo.puedeViajarA(unLugar)){
            vehiculo.gastarDeCombustibleCantidad(unLugar.combustible())
            lugares.add(unLugar)
        }
    }
}

object alambiqueVeloz {
    var combustible = 1000

    method combustible() = combustible

    method gastarDeCombustibleCantidad(unaCantidad){
        combustible = 0.max(combustible - unaCantidad)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        combustible += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion(self) and self.combustible() >= unLugar.combustible()

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)
}   

object superChatarraEspecial {
    var municion = 60000

    method combustible() = municion * 0.1

    method gastarDeCombustibleCantidad(unaCantidad){
        municion = 0.max(municion - unaCantidad * 10)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        municion += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion(self) and self.combustible() >= unLugar.combustible()

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)
}

object antiguallaBlindada {
    const property gangsters = ["pepe","pepita","pepona","pepe","pepote","papeto","papata"]
    var combustible = 5000
    
    method combustible() = combustible

    method velocidad() = self.largoNombresGangsters()

    method largoNombresGangsters() = gangsters.sum({gangster => gangster.length()}) 

    method gastarDeCombustibleCantidad(unaCantidad){
        combustible = 0.max(combustible - unaCantidad * 0.5)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        combustible += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion(self) and self.combustible() >= unLugar.combustible()

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)
}   

object superConvertible {
    var estaConvertido = false
    const combustible = 100000

    method estaConvertido() = estaConvertido
    
    method combustible() = combustible
    
    method cambiarEstadoDeConvertido(){
        estaConvertido = not estaConvertido
    }

    method gastarDeCombustibleCantidad(unaCantidad){

    }

    method cargarDeCombustibleCantidad(unaCantidad){

    }

    method puedeViajarA(unLugar) = estaConvertido 

    method puedeInscribirseEnCiudad(unaCiudad) = self.puedeViajarA(unaCiudad)

}

//PARTE 2
object centro {
    const property inscriptos = []
    const property rechazados = []
    var ciudad = buenosAires

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
        inscriptos.clear()
        rechazados.clear()
        self.todosLosVehiculos().forEach({vehiculo => self.verificarVechiculo(vehiculo)})
    }

    method todosLosVehiculos() = inscriptos + rechazados
    
    method iniciarCarerra() {
        inscriptos.forEach({vehiculo => vehiculo.viajarA(ciudad)})
    }
}