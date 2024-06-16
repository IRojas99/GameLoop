import wollok.game.*
import example.*
object juego {
	
	const property niveles=[]
	var property nivel=0	

	
	method nivelAct()= niveles.find{n=>n.nivelID()==nivel}
	method pasarSiguienteNivel(){ 			
			
			game.clear()
			
			nivel+=1
			if(nivel== niveles.size()){self.finalizar()}else{self.ponerNivel(niveles.find{n=>n.nivelID()==nivel})}
			}
	
	method finalizar(){game.clear()}
	method ponerNivel(niv){
		niv.objetos().forEach{o=>game.addVisual(o)}
		self.nivelAct().estructuraNivel()
		game.addVisual(self.cartelActual())
		
	}
	method sacarNivel(niv){
	
		niv.objetos().forEach{o=>game.removeVisual(o)}
	}
	
	method agregarNivel(nuevoNivel){
		niveles.add(nuevoNivel)
	}
	method cartelActual()=new CartelNivel()
	
	
	
	method nivel0()= new NivelComun(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 0,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		//LISTO: NIVEL COMUN
		
		method nivel1()= new NivelComun(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral(imagen="boton0.png",position =game.at(1,7)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 1,
		teclas=new BotonesParaMover(izquierda=keyboard.left(),derecha=keyboard.right(),arriba=keyboard.up(),abajo=keyboard.down())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		//LISTO:NIVEL COMUN, PERO LOS MOVIMIENTOS SON CON LAS FLECHAS
	method nivel2()= new NivelCajasInvisibles(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotonInvisible(imagen="objInvisible.png",position =game.at(1,7)),
		puertaAct=new PuertaInvisible(imagen="objInvisible.png", position=game.at(14,3)),
		nivelID= 2,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		//LISTO:NIVEL CON LOS OBJETOS INVISIBLES(FALTA PISTA)
	method nivel3()= new NivelSeMuevenSoloObj(perAct= new PerInvisble(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 3,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		//LISTO 
	method nivel4()= new NivelComun(perAct= new PerInvisble(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 4,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		//LISTO
	method agregarNiveles(){
		self.agregarNivel(self.nivel0())
		self.agregarNivel(self.nivel1())
		self.agregarNivel(self.nivel2())
		self.agregarNivel(self.nivel3())
		self.agregarNivel(self.nivel4())
	}

	
	method iniciar(){
		self.agregarNiveles()
		self.ponerNivel(self.nivelAct())
		if (self.nivelAct().condicionesParaPasarDeNivel()){self.pasarSiguienteNivel()}
		
		
	}
}
