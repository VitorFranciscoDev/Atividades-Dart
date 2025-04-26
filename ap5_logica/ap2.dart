import 'dart:math';

void main() {
  //Chama a função numeroLetra e passa um número aleatório como parâmetro
  final random = Random();
  numeroLetra(random.nextInt(26)+1);
  numeroLetra(random.nextInt(26)+1);
  numeroLetra(random.nextInt(26)+1);
  numeroLetra(random.nextInt(26)+1);
  numeroLetra(random.nextInt(26)+1);
}

//Função que transforma número para letra com base no alfabeto
numeroLetra(int valor) {
  print("Numero $valor: letra ${String.fromCharCode(64+valor)}");
}