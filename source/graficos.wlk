import wollok.game.*
import source.personaje.jugador

class IconoItem {
  const x
  const y
  const imagen
  
  method position() = game.at(x, y)
  
  method image() = imagen
}

object interfaz {
  var iconos = []
  var posicionX = 0
  
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
  }
}