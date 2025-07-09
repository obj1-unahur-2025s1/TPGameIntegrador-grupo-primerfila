import wollok.game.*
import source.personaje.*
import config.controles.controles
import source.obstaculos.*
import source.enemigos.*
import source.objetos.*
import config.setup.juego
import source.puerta.Puerta

class Escenario {
  var objetosInteractuables = []
  var plataformas = []
  
  method objetosInteractuables() = objetosInteractuables
  
  method plataformas() = plataformas
  
  method iniciar()
  
  method esPantallaDeInicio() = false
  
  method esPantallaDeDerrota() = false
  
  method enemigos() = objetosInteractuables.filter({ o => o.esEnemigo() })
  
  method agregarVariosElementos(unaColeccion) {
    objetosInteractuables.addAll(unaColeccion)
  }
}

object fondoInicio {
  method position() = game.at(0, 0)
  
  method image() = "inicio.png"
}

object fondoInstrucciones {
  method position() = game.at(0, 0)
  
  method image() = "instrucciones.png"
}

object instrucciones {
  method mostrar() {
    game.clear()
    game.addVisual(fondoInstrucciones)
    keyboard.x().onPressDo({ self.volverAlMenu() })
  }
  
  method volverAlMenu() {
    game.removeVisual(fondoInstrucciones)
    menuInicio.iniciar()
  }
}

object menuInicio {
  var opcionSeleccionada = 1
  const opciones = [game.at(3, 2), game.at(3, 4)]
  const puntero = object {
    method position() = opciones.get(opcionSeleccionada)
    
    method image() = "puntero.png"
  }
  const musica = game.sound("intro.wav")
  
  method iniciar() {
    opcionSeleccionada = 0
    self.mostrar()
  }
  
  method mostrar() {
    game.clear()
    game.addVisual(fondoInicio)
    game.addVisual(puntero)
    self.configurarControles()
  }
  
  method configurarControles() {
    keyboard.up().onPressDo({ self.seleccionarArriba() })
    keyboard.down().onPressDo({ self.seleccionarAbajo() })
    keyboard.x().onPressDo({ self.confirmar() })
  }
  
  method seleccionarArriba() {
    opcionSeleccionada = 1
    game.removeVisual(puntero)
    game.addVisual(puntero)
  }
  
  method seleccionarAbajo() {
    opcionSeleccionada = 0
    game.removeVisual(puntero)
    game.addVisual(puntero)
  }
  
  method confirmar() {
    if (opcionSeleccionada == 1) {
      game.removeVisual(puntero)
      game.removeVisual(fondoInicio)
      juego.reiniciar()
    } else {
      if (opcionSeleccionada == 0) {
        game.removeVisual(puntero)
        game.removeVisual(fondoInicio)
        instrucciones.mostrar()
      }
    }
  }
}

class CorteReal inherits Escenario {
  override method iniciar() {
    game.removeVisual(jugador)
    game.boardGround("nuevoMapa.png")
    
    // Inicializamos las plataformas.
    const plataforma1 = new PlataformaAccesible(x = 4, y = 0)
    const plataforma2 = new PlataformaAccesible(x = 6, y = 0)
    const plataforma3 = new PlataformaAccesible(x = 0, y = 1)
    const plataforma4 = new PlataformaAccesible(x = 8, y = 1)
    const plataforma5 = new PlataformaAccesible(x = 0, y = 2)
    const plataforma7 = new PlataformaAccesible(x = 6, y = 2)
    const plataforma8 = new PlataformaAccesible(x = 0, y = 3)
    const plataforma10 = new PlataformaAccesible(x = 3, y = 3)
    const plataforma11 = new PlataformaAccesible(x = 3, y = 4)
    const plataforma12 = new PlataformaAccesible(x = 5, y = 5)
    const plataforma13 = new PlataformaAccesible(x = 8, y = 6)
    const plataforma14 = new PlataformaAccesible(x = 0, y = 7)
    const plataforma15 = new PlataformaAccesible(x = 0, y = 8)
    const plataforma16 = new PlataformaAccesible(x = 3, y = 8)
    const plataforma17 = new PlataformaAccesible(x = 7, y = 8)
    const puerta = new Puerta(x = 9, y = 9)
    objetosInteractuables.add(puerta)
    plataformas.addAll(
      [
        plataforma1,
        plataforma2,
        plataforma3,
        plataforma4,
        plataforma5,
        plataforma7,
        plataforma8,
        plataforma10,
        plataforma11,
        plataforma12,
        plataforma13,
        plataforma14,
        plataforma15,
        plataforma16,
        plataforma17
      ]
    )
    game.addVisual(plataforma1)
    game.addVisual(plataforma2)
    game.addVisual(plataforma3)
    game.addVisual(plataforma4)
    game.addVisual(plataforma5)
    game.addVisual(plataforma7)
    game.addVisual(plataforma8)
    game.addVisual(plataforma10)
    game.addVisual(plataforma11)
    game.addVisual(plataforma12)
    game.addVisual(plataforma13)
    game.addVisual(plataforma14)
    game.addVisual(plataforma15)
    game.addVisual(plataforma16)
    game.addVisual(plataforma17)
    
    // Obstáculos
    const pared1 = new Pared(x = 5, y = 0)
    const pared2 = new Pared(x = 3, y = 1)
    const pared3 = new Pared(x = 3, y = 2)
    const pared4 = new Pared(x = 5, y = 2)
    const pared6 = new Pared(x = 9, y = 3)
    const pared7 = new Pared(x = 2, y = 5)
    const pared8 = new Pared(x = 9, y = 5)
    const pared9 = new Pared(x = 9, y = 0)
    const pared10 = new Pared(x = 1, y = 8)
    const pared11 = new Pared(x = 2, y = 8)
    const pared12 = new Pared(x = 4, y = 8)
    const pared13 = new Pared(x = 8, y = 8)
    const pared14 = new Pared(x = 6, y = 8)
    objetosInteractuables.addAll(
      [
        pared1,
        pared2,
        pared3,
        pared4,
        pared6,
        pared7,
        pared8,
        pared9,
        pared10,
        pared11,
        pared12,
        pared13,
        pared14
      ]
    )
    game.addVisual(pared1)
    game.addVisual(pared2)
    game.addVisual(pared3)
    game.addVisual(pared4)
    game.addVisual(pared6)
    game.addVisual(pared7)
    game.addVisual(pared8)
    game.addVisual(pared9)
    game.addVisual(pared10)
    game.addVisual(pared11)
    game.addVisual(pared12)
    game.addVisual(pared13)
    game.addVisual(pared14)
    
    
    
    
    // Enemigos
    const enemigo1 = new CaballeroNegro(x = 5, y = 1)
    const enemigo2 = new Mago(x = 0, y = 3)
    const enemigo3 = new Mago(x = 1, y = 2)
    const enemigo4 = new CaballeroNegro(x = 5, y = 5)
    const enemigo5 = new CaballeroNegro(x = 1, y = 9)
    const enemigo6 = new CaballeroNegro(x = 5, y = 9)
    objetosInteractuables.addAll(
      [enemigo1, enemigo2, enemigo3, enemigo4, enemigo5, enemigo6]
    )
    game.addVisual(enemigo1)
    game.addVisual(enemigo2)
    game.addVisual(enemigo3)
    game.addVisual(enemigo4)
    game.addVisual(enemigo5)
    game.addVisual(enemigo6)
    game.addVisual(puerta)
    game.onTick(500, "tickEnemigo1", { enemigo1.moverAutomatico() })
    game.onTick(500, "tickEnemigo2", { enemigo2.moverAutomatico() })
    game.onTick(500, "tickEnemigo3", { enemigo3.moverAutomatico() })
    game.onTick(500, "tickEnemigo4", { enemigo4.moverAutomatico() })
    game.onTick(500, "tickEnemigo5", { enemigo5.moverAutomatico() })
    game.onTick(500, "tickEnemigo6", { enemigo6.moverAutomatico() })
    
    // Objetos del nivel
    const excalibur = new Excalibur(x = 7, y = 0)
    const crestaReal = new CrestaReal(x = 2, y = 1)
    const malla = new MallaMithril(x = 3, y = 3)
    const arco = new Arco(x = 9, y = 4)
    const llave = new Llave(x = 6, y = 5)
    objetosInteractuables.addAll([excalibur, crestaReal, malla, arco, llave])
    game.addVisual(excalibur)
    game.addVisual(crestaReal)
    game.addVisual(malla)
    game.addVisual(arco)
    game.addVisual(llave)
    // El jugador a último así queda encima de todos los objetos.
    game.addVisual(jugador)
  }
}

object derrota inherits Escenario {
  override method iniciar() {
    objetosInteractuables = []
    plataformas = []
    game.clear()
    self.decorarConCalaveras()
    game.addVisual(TextoDerrota)
    keyboard.r().onPressDo({ menuInicio.iniciar() })
  }
  
  method decorarConCalaveras() {
    game.addVisual(new Calavera(x = 1, y = 0))
    game.addVisual(new Calavera(x = 3, y = 0))
    game.addVisual(new Calavera(x = 5, y = 0))
    game.addVisual(new Calavera(x = 7, y = 0))
    game.addVisual(new Calavera(x = 9, y = 0))
    
    game.addVisual(new Calavera(x = 0, y = 1))
    game.addVisual(new Calavera(x = 2, y = 1))
    game.addVisual(new Calavera(x = 4, y = 1))
    game.addVisual(new Calavera(x = 6, y = 1))
    game.addVisual(new Calavera(x = 8, y = 1))
    
    game.addVisual(new Calavera(x = 1, y = 9))
    game.addVisual(new Calavera(x = 3, y = 9))
    game.addVisual(new Calavera(x = 5, y = 9))
    game.addVisual(new Calavera(x = 7, y = 9))
    game.addVisual(new Calavera(x = 9, y = 9))
    
    game.addVisual(new Calavera(x = 0, y = 2))
    game.addVisual(new Calavera(x = 2, y = 2))
    game.addVisual(new Calavera(x = 4, y = 2))
    game.addVisual(new Calavera(x = 6, y = 2))
    game.addVisual(new Calavera(x = 8, y = 2))
  }
}

object victoria inherits Escenario {
  override method iniciar() {
    game.clear()
    objetosInteractuables.clear()
    plataformas.clear()
    self.decorarConCorazones()
    game.addVisual(TextoVictoria)
    keyboard.r().onPressDo({ menuInicio.iniciar() })
  }
  
  method decorarConCorazones() {
    game.addVisual(new Corazon(x = 0, y = 0))
    game.addVisual(new Corazon(x = 2, y = 0))
    game.addVisual(new Corazon(x = 4, y = 0))
    game.addVisual(new Corazon(x = 6, y = 0))
    game.addVisual(new Corazon(x = 8, y = 0))
    
    game.addVisual(new Corazon(x = 1, y = 9))
    game.addVisual(new Corazon(x = 3, y = 9))
    game.addVisual(new Corazon(x = 5, y = 9))
    game.addVisual(new Corazon(x = 7, y = 9))
    game.addVisual(new Corazon(x = 9, y = 9))
    
    game.addVisual(new Corazon(x = 0, y = 1))
    game.addVisual(new Corazon(x = 0, y = 3))
    game.addVisual(new Corazon(x = 0, y = 5))
    game.addVisual(new Corazon(x = 0, y = 7))
    game.addVisual(new Corazon(x = 0, y = 9))
    
    game.addVisual(new Corazon(x = 9, y = 0))
    game.addVisual(new Corazon(x = 9, y = 2))
    game.addVisual(new Corazon(x = 9, y = 4))
    game.addVisual(new Corazon(x = 9, y = 6))
    game.addVisual(new Corazon(x = 9, y = 8))
  }
}

object TextoVictoria {
  method position() = game.center()
  
  method text() = "¡Ganaste!"
  
  method textColor() = "00FF00FF"
}

object TextoDerrota {
  method position() = game.center()
  
  method text() = "¡Derrota!"
  
  method textColor() = "FF0000FF"
}