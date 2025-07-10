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
    objetosInteractuables.clear()
    plataformas.clear()
    game.clear()
    jugador.reiniciarEn(0, 0)
    
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

object fondoCalabozoFinal {
  method position() = game.at(0, 0)
  
  method image() = "mapaCalabozoFinal.png"
}

class CalabozoFinal inherits Escenario {
  override method iniciar() {
    game.clear()
    objetosInteractuables.clear()
    plataformas.clear()
    game.addVisual(fondoCalabozoFinal)
    jugador.reiniciarEn(0, 0)
    
    // Plataformas al inicio.
    const plataforma1 = new PlataformaAccesible(x = 2, y = 0)
    const plataforma2 = new PlataformaAccesible(x = 2, y = 1)
    const plataforma3 = new PlataformaAccesible(x = 2, y = 2)
    const plataforma4 = new PlataformaAccesible(x = 5, y = 0)
    const plataforma5 = new PlataformaAccesible(x = 5, y = 1)
    const plataforma6 = new PlataformaAccesible(x = 5, y = 2)
    const plataforma7 = new PlataformaAccesible(x = 1, y = 3)
    const plataforma8 = new PlataformaAccesible(x = 1, y = 4)
    const plataforma9 = new PlataformaAccesible(x = 1, y = 5)
    const plataforma10 = new PlataformaAccesible(x = 7, y = 6)
    const plataforma11 = new PlataformaAccesible(x = 4, y = 7)
    const plataforma12 = new PlataformaAccesible(x = 0, y = 8)
    const plataforma13 = new PlataformaAccesible(x = 9, y = 3)
    const plataforma14 = new PlataformaAccesible(x = 9, y = 4)
    const plataforma15 = new PlataformaAccesible(x = 9, y = 5)
    const plataforma16 = new PlataformaAccesible(x = 9, y = 6)
    const plataforma17 = new PlataformaAccesible(x = 9, y = 7)
    const plataforma18 = new PlataformaAccesible(x = 9, y = 8)
    plataformas.addAll(
      [
        plataforma1,
        plataforma2,
        plataforma3,
        plataforma4,
        plataforma5,
        plataforma6,
        plataforma7,
        plataforma8,
        plataforma9,
        plataforma10,
        plataforma11,
        plataforma12,
        plataforma13,
        plataforma14,
        plataforma15,
        plataforma16,
        plataforma17,
        plataforma18
      ]
    )
    game.addVisual(plataforma1)
    game.addVisual(plataforma2)
    game.addVisual(plataforma3)
    game.addVisual(plataforma4)
    game.addVisual(plataforma5)
    game.addVisual(plataforma6)
    game.addVisual(plataforma7)
    game.addVisual(plataforma8)
    game.addVisual(plataforma9)
    game.addVisual(plataforma10)
    game.addVisual(plataforma11)
    game.addVisual(plataforma12)
    game.addVisual(plataforma13)
    game.addVisual(plataforma14)
    game.addVisual(plataforma15)
    game.addVisual(plataforma16)
    game.addVisual(plataforma17)
    game.addVisual(plataforma18)
    
    // Obstáculos
    const pared1 = new Pared(x = 3, y = 0)
    const pared2 = new Pared(x = 3, y = 1)
    const pared3 = new Pared(x = 3, y = 2)
    const pared4 = new Pared(x = 7, y = 0)
    const pared5 = new Pared(x = 6, y = 1)
    const pared6 = new Pared(x = 6, y = 2)
    const pared7 = new Pared(x = 9, y = 2)
    const pared8 = new Pared(x = 8, y = 4)
    const pared9 = new Pared(x = 8, y = 5)
    const pared10 = new Pared(x = 8, y = 6)
    const pared11 = new Pared(x = 8, y = 7)
    const pared12 = new Pared(x = 8, y = 8)
    const pared13 = new Pared(x = 7, y = 8)
    const pared14 = new Pared(x = 7, y = 9)
    const pared15 = new Pared(x = 7, y = 5)
    const pared16 = new Pared(x = 0, y = 4)
    const pared17 = new Pared(x = 2, y = 4)
    const pared18 = new Pared(x = 0, y = 5)
    const pared19 = new Pared(x = 2, y = 5)
    const pared20 = new Pared(x = 4, y = 0)
    const pared21 = new Pared(x = 4, y = 1)
    const pared22 = new Pared(x = 6, y = 8)
    objetosInteractuables.addAll(
      [
        pared1,
        pared2,
        pared3,
        pared4,
        pared5,
        pared6,
        pared7,
        pared8,
        pared9,
        pared10,
        pared11,
        pared12,
        pared13,
        pared14,
        pared15,
        pared16,
        pared17,
        pared18,
        pared19,
        pared20,
        pared21,
        pared22
      ]
    )
    game.addVisual(pared1)
    game.addVisual(pared2)
    game.addVisual(pared3)
    game.addVisual(pared4)
    game.addVisual(pared5)
    game.addVisual(pared6)
    game.addVisual(pared7)
    game.addVisual(pared8)
    game.addVisual(pared9)
    game.addVisual(pared10)
    game.addVisual(pared11)
    game.addVisual(pared12)
    game.addVisual(pared13)
    game.addVisual(pared14)
    game.addVisual(pared15)
    game.addVisual(pared16)
    game.addVisual(pared17)
    game.addVisual(pared18)
    game.addVisual(pared19)
    game.addVisual(pared20)
    game.addVisual(pared21)
    game.addVisual(pared22)
    
    // Enemigos
    const enemigoFinal1 = new Mago(x = 4, y = 3)
    const enemigoFinal2 = new CaballeroNegro(x = 2, y = 6)
    const enemigoFinal3 = new CaballeroNegro(x = 4, y = 9)
    objetosInteractuables.addAll([enemigoFinal1, enemigoFinal2, enemigoFinal3])
    game.addVisual(enemigoFinal1)
    game.addVisual(enemigoFinal2)
    game.addVisual(enemigoFinal3)
    game.onTick(500, "tickEnemigo1", { enemigoFinal1.moverAutomatico() })
    game.onTick(500, "tickEnemigo2", { enemigoFinal2.moverAutomatico() })
    game.onTick(500, "tickEnemigo3", { enemigoFinal3.moverAutomatico() })
    
    // Objetos
    const excaliburFinal = new Excalibur(x = 6, y = 0)
    const crestaRealFinal = new CrestaReal(x = 2, y = 6)
    const mallaFinal = new MallaMithril(x = 0, y = 7)
    const arcoFinal = new Arco(x = 7, y = 3)
    const llaveFinal = new Llave(x = 6, y = 9)
    objetosInteractuables.addAll(
      [excaliburFinal, crestaRealFinal, mallaFinal, arcoFinal, llaveFinal]
    )
    game.addVisual(excaliburFinal)
    game.addVisual(crestaRealFinal)
    game.addVisual(mallaFinal)
    game.addVisual(arcoFinal)
    game.addVisual(llaveFinal)
    
    // Puerta final
    const puertaFinal = new Puerta(x = 8, y = 9)
    objetosInteractuables.add(puertaFinal)
    game.addVisual(puertaFinal)
    // Jugador a lo últmo así se superpone con todo :B
    game.addVisual(jugador)
  }
}

object fondoDerrota {
  method position() = game.at(0, 0)
  
  method image() = "derrota.png"
}

object derrota inherits Escenario {
  override method iniciar() {
    objetosInteractuables = []
    plataformas = []
    game.clear()
    game.addVisual(fondoDerrota)
    keyboard.r().onPressDo({ menuInicio.iniciar() })
  }
}

object fondoVictoria {
  method position() = game.at(0, 0)
  
  method image() = "victoria.png"
}

object victoria inherits Escenario {
  override method iniciar() {
    objetosInteractuables.clear()
    plataformas.clear()
    game.clear()
    game.addVisual(fondoVictoria)
    keyboard.r().onPressDo({ menuInicio.iniciar() })
  }
}