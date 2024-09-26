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

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion() and self.combustible() >= unLugar.combustible()

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

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion() and self.combustible() >= unLugar.combustible()

}

object antiguallaBlindada {
    var cantidadGangster = 50

    method combustible() = cantidadGangster * 5

    method gastarDeCombustibleCantidad(unaCantidad){
        cantidadGangster = 0.max(cantidadGangster - unaCantidad * 0.5)
    }

    method cargarDeCombustibleCantidad(unaCantidad){
        cantidadGangster += unaCantidad
    }

    method puedeViajarA(unLugar) = not unLugar.tieneRestriccion() and self.combustible() >= unLugar.combustible()

}   

object superConvertible {
    var estaConvertido = false
    var combustible = 100000

    method estaConvertido() = estaConvertido
    
    method combustible() = combustible
    
    method cambiarEstadoDeConvertido() = not estaConvertido

    method gastarDeCombustibleCantidad(unaCantidad){

    }

    method cargarDeCombustibleCantidad(unaCantidad){

    }

    method puedeViajarA(unLugar) = not estaConvertido 

}   