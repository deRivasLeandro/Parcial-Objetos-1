import parcelas.*

class Planta {

	const property anioDeObtencion
	var property altura

	method horasToleranciaAlSol()

	method esFuerte() = self.horasToleranciaAlSol() > 10

	method daSemillas() = self.esFuerte()

	method espacio()
	
	method esIdeal(parcela)

}

class Menta inherits Planta {

	override method horasToleranciaAlSol() = 6

	override method daSemillas() = super() or altura > 0.4

	override method espacio() = altura * 3

	override method esIdeal(parcela) = parcela.superficie() > 6

}

class Soja inherits Planta {

	override method horasToleranciaAlSol() {
		return if (altura < 0.5) {
			6
		} else if (altura.between(0.5, 1)) {
			7
		} else {
			9
		}
	}

	override method daSemillas() {
		return super() or (anioDeObtencion > 2007 and altura > 1)
	}

	override method espacio() = altura / 2

	override method esIdeal(parcela) = self.horasToleranciaAlSol() == parcela.horasDeSolPorDia()

}

class Quinoa inherits Planta {

	var property horasToleranciaAlSol

	override method espacio() = 0.5

	override method daSemillas() = super() or (anioDeObtencion < 2005)

	override method esIdeal(parcela) = not parcela.plantas().any({ p => p.altura() > 1.5})

}

class SojaTransgenica inherits Soja {

	override method daSemillas() = false

	override method esIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1

}

class Hierbabuena inherits Menta {

	override method espacio() = super() * 2

}

