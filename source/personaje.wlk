import config.setup.*
import wollok.game.*
import config.*
import source.*
import source.escenarios.*
import source.graficos.*

object jugador {
  var posicion = game.at(0, 0)
  var vida = 3
  var inventario = []
  var frameActual = 0
  var direccion = "derecha"
  
  method image() = "personajeFrame".concat(direccion.capitalize()).concat(
    ((frameActual % 2) + 1).toString()
  ).concat(".png")
  
  method position() = posicion
  
  method position(x, y) {
    posicion = game.at(x, y)
  }
  
  method vida(unaVida) {
    vida = unaVida
  }
  
  method tieneVida() = vida > 0
  
  method tieneArmas() = inventario.size() > 0
  
  method vida() = vida
  
  method totalDeObjetos() = inventario.size()
  
  method inventario() = inventario
  
  method mover(nuevaPosicion) {
    self.direccionDelJugador(nuevaPosicion)
    self.recibirDañoSiHayEnemigo(nuevaPosicion)
    if (self.estaDentroDeLimites(nuevaPosicion) && (!self.hayObstaculoEn(
        nuevaPosicion
      ))) self.actualizarPosicion(nuevaPosicion)
  }
  
  method noHayObstaculosNiEnemigos(nuevaPosicion) = (!self.hayObstaculoEn(
    nuevaPosicion
  )) && (!self.hayEnemigo(nuevaPosicion))
  
  method puedeMoverseA(nuevaPosicion) = self.estaDentroDeLimites(
    nuevaPosicion
  ) && self.noHayObstaculosNiEnemigos(nuevaPosicion)
  
  method direccionDelJugador(nuevaPosicion) {
    if (nuevaPosicion.x() < posicion.x()) {
      direccion = "izquierda"
    }
    if (nuevaPosicion.x() > posicion.x()) {
      direccion = "derecha"
    }
  }
  
  method actualizarPosicion(nuevaPosicion) {
    posicion = nuevaPosicion
    frameActual += 1
    game.removeVisual(self)
    game.addVisual(self)
  }
  
  method objetoEnMismaPosicion() = juego.escenarioActual().objetosInteractuables().find(
    { o => o.position().equals(posicion) }
  )
  
  method hayEnemigo(pos) = juego.escenarioActual().enemigos().any(
    { e => e.position().equals(pos) }
  )
  
  method hayEnemigoEnMiPosicion() = self.hayEnemigo(posicion)
  
  method tieneArmaPara(enemigo) = inventario.any(
    { arma => arma.puedeAtacar(enemigo) }
  )
  
  method puedeObtener(objeto) = objeto.esObtenible()
  
  method interactuarConPuerta() {
    if (juego.nivelActual() == 1) {
      game.say(self, "Toco la puerta")
      self.pasarAlCalabozoFinal()
    } else {
      if (juego.nivelActual() == 2) self.intentarGanar()
    }
  }
  
  method interactuar(objetoEnMismaPosicion) {
    if ((objetoEnMismaPosicion != null) && objetoEnMismaPosicion.esPuerta()) {
      self.interactuarConPuerta()
    } else {
      if ((objetoEnMismaPosicion != null) && self.puedeObtener(
          objetoEnMismaPosicion
        )) self.obtenerObjeto(objetoEnMismaPosicion)
      else self.error("No hay objetos acá.")
    }
  }
  
  method pasarAlCalabozoFinal() {
    game.sound("subirEscalera.wav").play()
    game.say(self, "Avanzo al calabozo final...")
    juego.detenerEnemigos()
    juego.avanzarNivel()
  }
  
  method intentarGanar() {
    if (self.totalDeObjetos() == 5) {
      game.say(self, "¡Tengo todas las reliquias!")
      juego.detenerEnemigos()
      juego.cambiarEscenario(victoria)
      game.removeVisual(self)
      juego.escenarioActual().iniciar()
    } else {
      game.say(self, "Me faltan reliquias.")
    }
  }
  
  method obtenerObjeto(objeto) {
    inventario.add(objeto)
    juego.escenarioActual().objetosInteractuables().remove(objeto)
    game.sound("obtenerItem.wav").play()
    game.removeVisual(objeto)
    interfaz.agregarItem(objeto)
  }
  
  method estaSobrePlataforma() = juego.escenarioActual().plataformas().any(
    { o => o.position().equals(posicion) && o.esPlataformaAccesible() }
  )
  
  method hayPlataformaDebajo() = juego.escenarioActual().plataformas().any(
    { o => o.position().equals(posicion.down(1)) && o.esPlataformaAccesible() }
  )
  
  method estaDentroDeLimites(
    pos
  ) = (((pos.x() >= 0) && (pos.x() < game.width())) && (pos.y() >= 0)) && (pos.y() < game.height())
  
  method hayObstaculoEn(
    pos
  ) = juego.escenarioActual().objetosInteractuables().any(
    { e => e.position().equals(pos) && e.esObstaculo() }
  )
  
  method recibirDañoSiHayEnemigo(pos) {
    if (self.hayEnemigo(pos) && self.tieneVida()) {
      game.sound("hit.wav").play()
      vida -= 1
      interfaz.mostrarVidas(vida)
      if (vida == 0) {
        juego.detenerEnemigos()
        juego.cambiarEscenario(derrota)
        game.removeVisual(self)
        juego.escenarioActual().iniciar()
      }
    }
  }
  
  method enemigoEnMiPosicion() = juego.escenarioActual().enemigos().find(
    { e => e.position().equals(posicion) }
  )
  
  method reiniciar() {
    posicion = game.at(0, 0)
    vida = 3
    inventario = []
    frameActual = 0
    direccion = "derecha"
  }
  
  method reiniciarEn(x, y) {
    self.position(x, y)
    self.vida(3)
    inventario.clear()
    interfaz.reiniciar()
  }
}