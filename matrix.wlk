object neo{
    var energia  = 100
   method esElElegido() = true  
   method saltar(){
     energia = energia *0.5
     //tambien se puede definir como method energia /2
   }
   method vitalidad() = energia * 0.1
   //tambien se puede definir como method vitalidad() = energia /10  
}
object morfeo{
    var vitalidad = 8
    var estaDescansado = true 

    method esElElegido() = false
    method saltar(){
        estaDescansado = ! estaDescansado
        vitalidad  = (vitalidad -1).max(0)
    }
    method vitalidad() = vitalidad
}
object trinity{
    method esElElegido() = false
    method vitalidad() = 0
    method saltar(){}
}
object nave{
   // conjunto vacio var pasajeros = #{}; lista vacia var pasajeros = []
    const pasajeros =#{neo, morfeo, trinity}
   method cuantosPasajerosHay() = pasajeros.size()
   method pasajerosDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
   method pasajerosDeMenorVitalidad() = pasajeros.min({p => p.vitalidad()})
   method estaEquilibrada(){
      return
      self.pasajerosDeMayorVitalidad().vitalidad() 
      < 
      self.pasajerosDeMenorVitalidad().vitalidad() *2 // o /2
   }
   method estaElElegido() = pasajeros.any({p => p.esElElegido()})
   method chocar(){
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
   }
   method acelerar(){
    pasajeros.filter({p => not p.esElElegido()}).forEach ({p => p.saltar()})
    pasajeros.remove(neo)
   }

}