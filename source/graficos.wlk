import wollok.game.*
import source.personaje.jugador

class IconoItem {
  const x
  const y
  const imagen
  
  method position() = game.at(x, y)
  
  method image() = imagen
}

class IconoVida {
  const x
  const y
  
  method position() = game.at(x, y)
  
  method image() = "corazon.png"
}

object interfaz {
  var iconos = []
  var posicionX = 0
  var vida1 = new IconoVida(x = 7, y = 10)
  var vida2 = new IconoVida(x = 8, y = 10)
  var vida3 = new IconoVida(x = 9, y = 10)
  
  method agregarItem(objeto) {
    const icono = new IconoItem(x = posicionX, y = 10, imagen = objeto.image())
    iconos.add(icono)
    game.addVisual(icono)
    posicionX += 1
  }
  
  method reiniciar() {
    iconos.forEach({ i => game.removeVisual(i) })
    iconos = []
    posicionX = 0
    self.mostrarVidas(3)
  }
  
  method mostrarVidas(cantidad) {
    game.removeVisual(vida1)
    game.removeVisual(vida2)
    game.removeVisual(vida3)
    
    if (cantidad >= 1) game.addVisual(vida1)
    if (cantidad >= 2) game.addVisual(vida2)
    if (cantidad == 3) game.addVisual(vida3)
  }
}