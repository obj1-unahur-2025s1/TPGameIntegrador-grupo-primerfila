import source.elemento.Elemento
import wollok.game.*

class Objeto inherits Elemento {
  const posicion = game.at(x, y)
  
  method position() = posicion
  
  method image()
  
  override method esObstaculo() = false
  
  method esObtenible() = true
  
  override method esEnemigo() = false
  
  override method esPuerta() = false
}

class Excalibur inherits Objeto {
  override method image() = "itemExcalibur.png"
}

class RunaFehu inherits Objeto {
  override method image() = "itemFehu.png"
}

class CrestaReal inherits Objeto {
  override method image() = "itemCresta.png"
}

class MallaMithril inherits Objeto {
  override method image() = "itemMallaMithril.png"
}

class Arco inherits Objeto {
  override method image() = "itemArco.png"
}

class Llave inherits Objeto {
  override method image() = "llave.png"
}

class Corazon inherits Objeto {
  override method image() = "corazon.png"
  
  override method esObtenible() = false
}

class Calavera inherits Objeto {
  override method image() = "calavera.png"
  
  override method esObtenible() = false
}