import wollok.game.*
import example.*
object juego {
	
	const property niveles=[]
	var property nivel=0	
	var property inicie = false

	
	method nivelAct()= niveles.find{n=>n.nivelID()==nivel}
	method pasarSiguienteNivel(){			
			nivel+=1
			game.clear()
			
			if(nivel== niveles.size()){self.finalizar()}else{self.ponerNivel(niveles.find{n=>n.nivelID()==nivel})}
			}
	
	method finalizar(){game.clear()}
	method ponerNivel(niv){
		
		niv.objetos().forEach{o=>game.addVisual(o)}
		game.addVisual(self.cartelActual())
		self.nivelAct().estructuraNivel()
		segundero.comenzarSegundero()
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
		method nivel4()= new NivelComun(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaAbierta(imagen="puerta1.png", position=game.at(14,3)),
		nivelID= 4,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		method nivel5()= new NivelComun(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotonPuerta( imagen="puerta0.png", position =game.at(1,7)),
		puertaAct=new PuertaBoton(imagen="boton0.png", position=game.at(14,3)),
		nivelID= 5,
		teclas=new BotonesParaMover(izquierda=keyboard.d(),derecha=keyboard.a(),arriba=keyboard.s(),abajo=keyboard.w())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		method nivel7()= new NivelComun(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaSiempreAbierta(imagen="puerta1.png", position=game.at(1,1)),
		nivelID= 7,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(14,3)))
		//LISTO 
	method nivel6()= new NivelComun(perAct= new PerInvisble(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 6,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		//LISTO
		method nivel8()= new NivelComun(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(1,7)),
		puertaAct=new PuertaReinicio(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 8,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		method nivel9()=new NivelAlto(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(6,10)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 9,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
		method nivel10()=new NivelPista(perAct= new PerGral(imagen="tipitoDer.png",position=game.at(2,1)),
		botAct=new BotGral( imagen="boton0.png", position =game.at(6,10)),
		puertaAct=new PuertaGral(imagen="puerta0.png", position=game.at(14,3)),
		nivelID= 10,
		teclas=new BotonesParaMover(izquierda=keyboard.a(),derecha=keyboard.d(),arriba=keyboard.w(),abajo=keyboard.s())
		,cartelPistaAct=new CartelPista()
		,puertaAnt=new PuertaAnt(position=game.at(1,1)))
	method agregarNiveles(){
		self.agregarNivel(self.nivel0())
		self.agregarNivel(self.nivel1())
		self.agregarNivel(self.nivel2())
		self.agregarNivel(self.nivel3())
		self.agregarNivel(self.nivel4())
		self.agregarNivel(self.nivel5())
		self.agregarNivel(self.nivel6())
		self.agregarNivel(self.nivel7())
		self.agregarNivel(self.nivel8())
		self.agregarNivel(self.nivel9())
		self.agregarNivel(self.nivel10())
	}

	method inicio(){
		
		game.addVisual(fondoInicio)
		game.addVisual(teclasInicio)
		var fotograma=0
		game.addVisual(pantallaInicio)
		game.onTick(300,"cambioInicio",{
			game.removeVisual(pantallaInicio)
			pantallaInicio.newImagen(fotograma)
			game.addVisual(pantallaInicio)
			fotograma +=1})
			
			var fotogramaStart=0
			game.addVisual(start)
			game.onTick(125,"cambioStart",{
				game.removeVisual(start)
				start.newImagen(fotogramaStart)
				game.addVisual(start)
				fotogramaStart+=1})
				
			
			}
		
		method jugar(){
		self.agregarNiveles()
		self.ponerNivel(self.nivelAct())
		if (self.nivelAct().condicionesParaPasarDeNivel()){self.pasarSiguienteNivel()}
		}	
		method iniciar(){
		self.inicio()
		if(not inicie){keyboard.enter().onPressDo{game.clear() self.jugar() inicie=true}}
		}		
		}
		
		
	

