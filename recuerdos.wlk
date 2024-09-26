object bidon {

    method anioEstaDentro(unAnio) = unAnio.between(1000, 1499) 
}

object bomba {

    method anioEstaDentro(unAnio) = unAnio.between(1500, 1999) 
}

object jardin {

    method anioEstaDentro(unAnio) = unAnio >= 2000
}