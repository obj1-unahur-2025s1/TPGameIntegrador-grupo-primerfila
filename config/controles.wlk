import wollok.game.*
import source.personaje.*
import source.obstaculos.*
import config.setup.juego
import source.escenarios.*

object controles {
  method configurar() {
    keyboard.left().onPressDo({ jugador.mover(jugador.position().left(1)) })
    
    keyboard.right().onPressDo({ jugador.mover(jugador.position().right(1)) })
    
    keyboard.up().onPressDo(
      { if (jugador.estaSobrePlataforma()) jugador.mover(
            jugador.position().up(1)
          ) }
    )
    
    keyboard.down().onPressDo(
      { if (jugador.estaSobrePlataforma() || jugador.hayPlataformaDebajo())
          jugador.mover(jugador.position().down(1)) }
    )
    
    
    keyboard.x().onPressDo(
      { jugador.interactuar(jugador.objetoEnMismaPosicion()) }
    )
  }
}