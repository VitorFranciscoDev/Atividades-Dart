import 'dart:collection';

//Tempo cronometrado: 32:50

void main() {
  final baralho = Baralho();

  //Empilhando as cartas
  baralho.empilharCarta(Carta("A", '\u2663'));
  baralho.empilharCarta(Carta("A", '\u2665'));
  baralho.empilharCarta(Carta("A", '\u2660'));
  baralho.empilharCarta(Carta("A", '\u2666'));

  //while para remover as cartas do baralho
  while(!baralho.vazio()) {
    final cartaRemovida = baralho.removerCarta();
    print("Carta removida: $cartaRemovida");
  }
}

class Carta {
  //Declaração de variáveis
  final String naipe;
  final String valor;
  final Set<String> naipes = {'\u2663', '\u2665', '\u2660', '\u2666'};

  Carta(this.valor, this.naipe) {
    if(!naipes.contains(naipe)) { //Verifica se o naipe é válido
      throw ArgumentError("Naipe inválido.");
    }
  }

  //Formatação
  String toString() {
    return "$valor $naipe";
  }
}

class Baralho {
  //Declaração da coleção
  final Queue<Carta> baralho = Queue<Carta>();

  //Métodos para empilhar e remover cartas
  void empilharCarta(Carta carta) {
    baralho.addLast(carta);
  }

  Carta removerCarta() {
    return baralho.removeLast();
  }

  bool vazio() => baralho.isEmpty;
}