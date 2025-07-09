import wollok.game.*
import source.personaje.*
import config.controles.controles
import source.escenarios.*
import source.graficos.*

object juego {
  var escenarioActual = new CorteReal()
  var nivelActual = 1
  
  method nivelActual() = nivelActual
  
  method nivelActual(unNivel) {
    nivelActual = unNivel
  }
  
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
    interfaz.mostrarVidas(jugador.vida())
    // A veces no carga el reinicio de vida por lo que fuerzo esto por las dudas.
  }
  
  method reiniciar() {
    self.detenerEnemigos()
    game.clear()
    interfaz.reiniciar()
    jugador.reiniciar()
    nivelActual = 1
    self.cambiarEscenario(new CorteReal())
    self.iniciar()
  }
  
  method avanzarNivel() {
    if (nivelActual == 1) {
      self.nivelActual(2)
      game.removeVisual(jugador)
      self.cambiarEscenario(new CalabozoFinal())
      escenarioActual.iniciar()
      self.iniciar()
    } else {
      self.detenerEnemigos()
      self.cambiarEscenario(victoria)
      game.removeVisual(jugador)
      escenarioActual.iniciar()
      self.iniciar()
    }
  }
}