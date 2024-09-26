import alambique.*
object paris {

    method recuerdo() = "Llavero de la torre effiel"

    method tieneRestriccion() = alambiqueVeloz.combustible() < self.combustible()

    method combustible() = 200
}

object buenosAires {
    const property presidentesConYerba = ["milei","macri","peron","cristina"] 
    var property presidenteActual = "YO"

    method recuerdo() =  "Mate" 

    method elRecuerdoTraeYerba() = presidentesConYerba.contains(presidenteActual)

    method tieneRestriccion() = self.esRapido() 

    method esRapido() = alambiqueVeloz.combustible() < 2 * self.combustible()

    method combustible() = 50
}

object bagdad {
    var property anio = 1990 
    
    method recuerdo() = self.recuerdoDelAnio(anio)

    method recuerdoDelAnio(unAnio) = if(unAnio.even()) "Bidon de petroleo" else "AK-47" 

    method tieneRestriccion() = false

    method combustible() = 150
}

object lasVegas {
    var property lugarConmemorado = bagdad
    
    method recuerdo() = lugarConmemorado.recuerdo()

    method tieneRestriccion() = lugarConmemorado.tieneRestriccion()

    method combustible() = 120
}