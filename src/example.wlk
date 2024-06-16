import wollok.game.*
import objects.*
class NivelComun {
	var perAct
	var botAct
	var puertaAct
	const nivelID
	const property teclas
	var cartelPistaAct
	var puertaAnt
	
method perAct()= perAct
method botAct()= botAct
method puertaAct()=puertaAct
method nivelID() = nivelID
method cartelPistaAct()=cartelPistaAct
method condicionesParaPasarDeNivel()= self.puertaAct().abierta()//and puertaAct.estoyEnPuerta()
method movimiento(obj){
		teclas.derecha().onPressDo({	
		obj.nuevaPosicion(game.at(tablero.anchoMax().min(obj.position().x()+1),obj.position().y()))
		obj.animarDer()	})
		teclas.izquierda().onPressDo({
		obj.nuevaPosicion(game.at(1.max(obj.position().x()-1),obj.position().y()))		
		obj.animarIzq()
		})
		teclas.arriba().onPressDo({
		obj.nuevaPosicion(game.at(obj.position().x(),tablero.altoMax().min(obj.position().y()+1)))		
		obj.animarArriba()
		})
		teclas.abajo().onPressDo({
		obj.nuevaPosicion(game.at(obj.position().x(),1.max(obj.position().y()-1)))	
		obj.animarAbajo()	})
		
			}

method agregarCajaEn(posicion) {
		const caja = new Caja(position = posicion)
		game.addVisual(caja)
	}
method dibujarCajas(){
	[game.at(1,6),game.at(2,6),game.at(12,6),game.at(13,6),game.at(8,5),game.at(9,5),
		game.at(9,5),game.at(10,5),game.at(7,3),game.at(2,2),game.at(5,3),game.at(6,3),game.at(14,4),game.at(14,2),game.at(1,2)].forEach{
			pos=>self.agregarCajaEn(pos)
		}
	
	
	}
method pista(){
	keyboard.p().onPressDo({cartelPistaAct.pedirPista()})
}
method pasarDeNivel(){
game.whenCollideDo(puertaAct,{o=>if(o.puedeTocarPuerta()and self.condicionesParaPasarDeNivel()){juego.pasarSiguienteNivel()}})
}
method resetNivel(){
		perAct.resetear()
		botAct.resetear()
		puertaAct.resetear()
	}

method cambiarEstado(obj){obj.cambiarEstado()}
method estructuraNivel(){
self.dibujarCajas()
self.movimiento(perAct)
self.pista()
game.whenCollideDo(self.botAct(),{o=>if(o.puedeTocarBoton()){self.botAct().cambiarEstado() self.puertaAct().cambiarEstado()}})
self.pasarDeNivel()
keyboard.r().onPressDo({self.resetNivel()})
}
method objetos()=[tablero,botAct,puertaAct,puertaAnt,perAct,cartelPistaAct]	
}





class ObjGral{
const casillerosQNoPuede = [game.at(1,6),game.at(2,6),game.at(12,6),game.at(13,6),game.at(8,5),game.at(9,5),
		game.at(9,5),game.at(10,5),game.at(7,3),game.at(2,2),game.at(5,3),game.at(6,3),game.at(14,4),game.at(14,2),game.at(1,2)]
var position
var imagen
method position()= position
method image()=imagen
method cambiarEstado()
method puedeTocarBoton()
method puedeTocarPuerta()

method nuevaPosicion(nueva){
	if (self.puedeMover(nueva))
	position=nueva
}
method animarDer()
method animarIzq()
method animarArriba()
method animarAbajo()
method puedeMover(posicion){
	return not casillerosQNoPuede.contains(posicion)
}
method resetear()
}

class PerGral inherits ObjGral{
	override method cambiarEstado(){}
	override method puedeTocarBoton()=true
	override method puedeTocarPuerta()=true
	override method animarDer(){imagen="tipitoDer.png"}
	override method  animarIzq(){imagen="tipitoIzq.png"}
	override method animarArriba(){imagen="tipitoVuel.png"}
	override method animarAbajo(){imagen="tipitoAbajo.png"}
	override method resetear(){
		position=game.at(2,1)
		imagen="tipitoDer.png"
	}
}			
class BotGral inherits ObjGral{
	var   apretado=false
	
	override method cambiarEstado(){
		self.apretar()
		imagen ="boton1.png"
			}
	method apretar(){apretado=true}
	override method puedeTocarBoton()=false
	override method puedeTocarPuerta()=false
	override method animarDer(){}
	override method  animarIzq(){}
	override method animarArriba(){}
	override method animarAbajo(){}
 	override method resetear(){
 		apretado=false
 		imagen="boton0.png"
 	}
 }
 
 class PuertaGral inherits ObjGral{
	var property abierta=false
	override method cambiarEstado(){
		imagen="puerta1.png"
		abierta=true
	}
	
	
	override method puedeTocarBoton()=false
	override method puedeTocarPuerta()=false
	override method animarDer(){}
	override method  animarIzq(){}
	override method animarArriba(){}
	override method animarAbajo(){}
	override method resetear(){
		abierta=false
		imagen="puerta0.png"
	}
}
 	

object tablero {
	
	
	const property position= game.at(1,1)
	const property alto = 9
	const property ancho = 16	
	const  imagen= "tablero.png"
	
	
	method altoMax()= alto-2
	method anchoMax()=ancho-2
	method image()= imagen
	method pasarPuerta(puerta){}
	method apretarBoton(bot){}
	method puedeTocarBoton()=false
	method puedeTocarPuerta()=false
}	
	

class BotonesParaMover{
	
	var property izquierda
	var property derecha
	var property abajo
	var property arriba
}

class Caja{
	const property position
	const property image = "caja4.png"
}
class CartelNivel{
var property image = "cartelNivel"+juego.nivel()+".png"
const property position =game.at(1,9)	
}
class CartelPista{
	var imagen="pistaSinPedir.png"
	var property pistaPedida=false
	
	const property position =game.at(11,9)
	
method pedirPista(){
	imagen="pista"+juego.nivel()+".png"
	pistaPedida = true
}

method image()=imagen

	
	
}


class PuertaAnt{
	var position
	method position()=position
	method image()="puerta0.png"
	method puedeTocarBoton()=false
	method puedeTocarPuerta()=false
}
class BotonInvisible inherits BotGral{
	override method cambiarEstado(){
		self.apretar()
			}
	override method resetear(){
 		apretado=false
 	
 	}
}
class PuertaInvisible inherits PuertaGral{
	override method cambiarEstado(){
		abierta=true
			}
	override method resetear(){
 		abierta=false

 	}
}

class NivelCajasInvisibles inherits NivelComun{
override method objetos()=[botAct,puertaAct,puertaAnt,perAct,cartelPistaAct]
override method estructuraNivel(){
self.movimiento(perAct)
self.pista()
game.whenCollideDo(self.botAct(),{o=>if(o.puedeTocarBoton()){self.botAct().cambiarEstado() self.puertaAct().cambiarEstado()}})
keyboard.r().onPressDo({self.resetNivel()})
self.pasarDeNivel()
}
}


class PerInvisble inherits PerGral{
	const invisible= "objInvisible.png"
	override method animarDer(){imagen=invisible}
	override method  animarIzq(){imagen=invisible}
	override method animarArriba(){imagen=invisible}
	override method animarAbajo(){imagen=invisible}

}


class NivelSeMuevenSoloObj inherits NivelComun{
override method estructuraNivel(){
self.dibujarCajas()
self.movimiento(botAct)
self.movimiento(puertaAct)
self.pista()
game.whenCollideDo(self.botAct(),{o=>if(o.puedeTocarBoton()){self.botAct().cambiarEstado() self.puertaAct().cambiarEstado()}})
self.pasarDeNivel()
keyboard.r().onPressDo({self.resetNivel()})
}	
}