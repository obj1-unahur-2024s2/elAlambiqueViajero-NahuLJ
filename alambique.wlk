object luke {
    const property lugares = []

    method cantidadLugares() = lugares.size()

    method ultimoRecuerdo() = lugares.last().recuerdo() 

    method viajarA(unLugar) {
        if(alambiqueVeloz.puedeViajarA(unLugar)){
            alambiqueVeloz.gastarDeCombustibleCantidad(unLugar.combustible())
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