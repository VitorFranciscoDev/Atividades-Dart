import 'dart:math';

void main() {
  //Declaração das variáveis
  final random = Random();
  int num = random.nextInt(100)+1;

  //Chama a função
  int dobro = Calculadora.dobro(num);
  print("O dobro do número $num e: $dobro");
}

abstract class Calculadora {
  //Método static que retorna o valor multiplicado por 2
  static dobro(int valor) {
    return valor*2;
  }
}