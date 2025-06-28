import wollok.game.*
import source.elemento.Elemento

class Obstaculo inherits Elemento {
  const posicion = game.at(x, y)
  
  method position() = posicion
  
  override method esEnemigo() = false
  
  override method esPuerta() = false
}

class PlataformaAccesible inherits Obstaculo {
  method image() = "escaleraPlataforma.png"
  
  method esPlataformaAccesible() = true
  
  override method esObstaculo() = false
}

class Pared inherits Obstaculo {
  method image() = "obstaculoTest.png"
  
  override method esObstaculo() = true
}