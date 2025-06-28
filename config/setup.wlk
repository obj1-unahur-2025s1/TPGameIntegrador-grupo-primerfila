import wollok.game.*
import source.personaje.*
import config.controles.controles
import source.escenarios.*

object juego {
  var escenarioActual = corteReal
  
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
    escenarioActual.iniciar()
    controles.configurar()
  }
}