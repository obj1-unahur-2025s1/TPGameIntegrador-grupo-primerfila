import wollok.game.*
import source.elemento.Elemento

class Puerta inherits Elemento {
  const posicion = game.at(x, y)
  
  method image() = "puerta.png"
  
  method position() = posicion
  
  override method esObstaculo() = false
  
  override method esEnemigo() = false
  
  override method esPuerta() = true
  
  method esObtenible() = false
  
  method puedeObtener() = false
}