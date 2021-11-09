import semillas.*

class Parcela {

	var property ancho
	var property largo
	var property horasDeSolPorDia
	const property plantas = #{}

	method superficie() = ancho * largo

	method cantidadMaximaDePlantas() {
		return if (ancho > largo) {
			self.superficie() / 5
		} else {
			self.superficie() / 3 + largo
		}
	}

	method tieneComplicaciones() = plantas.any({ p => p.horasToleranciaAlSol() < horasDeSolPorDia })

	method esAptaParaParcela(planta) = plantas.size() + 1 <= self.cantidadMaximaDePlantas() and (horasDeSolPorDia - planta.horasToleranciaAlSol()) < 2

	method agregarPlanta(planta) {
		if (not self.esAptaParaParcela(planta)) {
			self.error("No se puede plantar.")
		}
		else {
			plantas.add(planta)
		}
	}
	
	method seAsociaBien(planta)
	
	method porcentajeDeBienAsociadas() = (plantas.count({p=>self.seAsociaBien(p)})/plantas.size())*100
}

class Ecologica inherits Parcela {

	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esIdeal(self)

}

class Industrial inherits Parcela {

	override method seAsociaBien(planta) = self.plantas().size() <= 2 and planta.esFuerte()

}
