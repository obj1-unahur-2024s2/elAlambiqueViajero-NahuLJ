import alambique.*
import recuerdos.*

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
    var property anioActual = 1990 
    const property recuerdos = [bidon, bomba, jardin]
    
    method recuerdo() = self.recuerdoDelAnio(anioActual)

    method recuerdoDelAnio(unAnio) =  recuerdos.find {recuerdo => recuerdo.anioEstaDentro(unAnio)}

    method tieneRestriccion() = false

    method combustible() = 150
}

object lasVegas {
    var property lugarConmemorado = bagdad
    
    method recuerdo() = lugarConmemorado.recuerdo()

    method tieneRestriccion() = lugarConmemorado.tieneRestriccion()

    method combustible() = 120
}

object manchester {
    
    method recuerdo() = "Llavero del Manchester City"

    method tieneRestriccion() = luke.ultimoRecuerdo() != "mate"

    method combustible() = 300
}