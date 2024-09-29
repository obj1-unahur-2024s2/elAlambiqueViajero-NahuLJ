import alambique.*
import recuerdos.*

object paris {

    method recuerdo() = "Llavero de la torre effiel"

    method tieneRestriccion(unVehiculo) = unVehiculo.combustible() < self.combustible()

    method combustible() = 200

    method longitudDelCircuito() = 4000
}

object buenosAires {
    const property presidentesConYerba = ["milei","macri","peron","cristina"] 
    var property presidenteActual = "YO"

    method recuerdo() =  "Mate" 

    method elRecuerdoTraeYerba() = presidentesConYerba.contains(presidenteActual)

    method tieneRestriccion(unVehiculo) = self.esRapido(unVehiculo) 

    method esRapido(unVehiculo) = unVehiculo.combustible() < 2 * self.combustible()

    method combustible() = 50

    method longitudDelCircuito() = 3020
}

object bagdad {
    var property anioActual = 1990 
    const property recuerdos = [bidon, bomba, jardin]
    
    method recuerdo() = self.recuerdoDelAnio(anioActual)

    method recuerdoDelAnio(unAnio) =  recuerdos.find {recuerdo => recuerdo.anioEstaDentro(unAnio)}

    method tieneRestriccion(unVehiculo) = false

    method combustible() = 150

    method longitudDelCircuito() = 3400
}

object lasVegas {
    var property lugarConmemorado = bagdad
    
    method recuerdo() = lugarConmemorado.recuerdo()

    method tieneRestriccion(unVehiculo) = lugarConmemorado.tieneRestriccion(unVehiculo)

    method combustible() = 120

    method longitudDelCircuito() = 4900
}

object manchester {
    
    method recuerdo() = "Llavero del Manchester City"

    method tieneRestriccion(unVehiculo) = luke.ultimoRecuerdo() != "mate"

    method combustible() = 300

    method longitudDelCircuito() = 2800
}