import wollok.game.*
import config.setup.juego

class Enemigo {
  var x
  var y
  var direccion = "izquierda"
  var frameActual = 0
  var vida = 1
  
  method position() = game.at(x, y)
  
  method position(unaPosicion) {
    x = unaPosicion.x()
    y = unaPosicion.y()
  }
  
  method mover(unaPosicion) {
    if (self.estaDentroDeLimites(unaPosicion) && (!self.hayObstaculoEn(
      unaPosicion
    ))) {
      self.position(unaPosicion)
      frameActual = (frameActual + 1) % 2
      game.removeVisual(self)
      game.addVisual(self)
    } else {
      self.cambiarDireccion()
    }
  }
  
  method moverAutomatico() {
    const unaPosicion = if (direccion == "izquierda") self.position().left(1)
                        else self.position().right(1)
    self.mover(unaPosicion)
  }
  
  method cambiarDireccion() {
    direccion = if (direccion == "izquierda") "derecha" else "izquierda"
  }
  
  method estaDentroDeLimites(
    pos
  ) = (((pos.x() >= 0) && (pos.x() < game.width())) && (pos.y() >= 0)) && (pos.y() < game.height())
  
  method hayObstaculoEn(
    pos
  ) = juego.escenarioActual().objetosInteractuables().any(
    { e => e.position().equals(pos) && e.esObstaculo() }
  )
  
  method recibirAtaque() {
    vida -= 1
    if (vida == 0) {
      juego.escenarioActual().objetosInteractuables().remove(self)
      game.removeVisual(self)
    }
  }
  
  method image()
  
  method esEnemigo() = true
  
  method esObstaculo() = true
  
  method esPuerta() = false
}

class Mago inherits Enemigo {
  override method image() = "magoFrame".concat(direccion.capitalize()).concat(
    ((frameActual % 2) + 1).toString()
  ).concat(".png")
  
  method esMago() = true
}

class CaballeroNegro inherits Enemigo {
  override method image() = "caballeroNegroFrame".concat(
    direccion.capitalize()
  ).concat(((frameActual % 2) + 1).toString()).concat(".png")
  
  method esCaballeroOscuro() = true
}