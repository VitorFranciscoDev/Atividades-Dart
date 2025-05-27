void main() {
  //Objeto da classe Cozinheiro
  Cozinheiro cozinheiro = Cozinheiro();

  //Chama as funções
  cozinheiro.fazerComida();
  cozinheiro.fazerBebida();
}

//Interface que possui o método fazerComida
abstract class Comida {
  void fazerComida();
}

//Interface que possui o método fazerBebida
abstract class Bebida {
  void fazerBebida();
}

class Cozinheiro implements Comida, Bebida {
  //Printa a atividade do cozinheiro
  void fazerComida() {
    print("O cozinheiro esta fazendo comida.");
  }
  void fazerBebida() {
    print("O cozinheiro esta fazendo bebida.");
  }
}