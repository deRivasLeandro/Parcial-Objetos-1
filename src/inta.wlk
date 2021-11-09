import parcelas.*
import semillas.*

object inta{
	const property parcelas = #{}
	
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	
	method promedioDePlantas() = self.parcelas().sum({ p => p.plantas().size() })/self.parcelas().size()
	method masAutosustentable() = self.parcelas().filter({p=>p.plantas().size()>4}).max({pl=>pl.porcentajeDeBienAsociadas()})
}