import wollok.game.*
import source.personaje.*
import config.controles.controles
import source.escenarios.*
import source.graficos.*

object juego {
  var escenarioActual = new CorteReal()
  
  method detenerEnemigos() {
    game.removeTickEvent("tickEnemigo1")
    game.removeTickEvent("tickEnemigo2")
    game.removeTickEvent("tickEnemigo3")
    game.removeTickEvent("tickEnemigo4")
    game.removeTickEvent("tickEnemigo5")
    game.removeTickEvent("tickEnemigo6")
  }
  
  method escenarioActual() = escenarioActual
  
  method cambiarEscenario(unEscenario) {
    escenarioActual = unEscenario
  }
  
  method iniciar() {
    jugador.reiniciarEn(0, 0)
    escenarioActual.iniciar()
    controles.configurar()
    game.removeVisual(jugador)
    game.addVisual(jugador)
  }
  
  method reiniciar() {
    self.detenerEnemigos()
    game.clear()
    interfaz.reiniciar()
    jugador.reiniciar()
    self.cambiarEscenario(new CorteReal())
    self.iniciar()
  }
}