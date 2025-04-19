import 'dart:math';

void main() {
  //declaração das variáveis
  var random = Random();
  int num1 = random.nextInt(101);
  int num2 = random.nextInt(101);
  int num3 = random.nextInt(101);
  int num4 = random.nextInt(101);
  int num5 = random.nextInt(101);
  int num6 = random.nextInt(101);
  int num7 = random.nextInt(101);
  int num8 = random.nextInt(101);
  int num9 = random.nextInt(101);
  int num10 = random.nextInt(101);

  //declaração da lista
  List <int> lista = [num1, num2, num3, num4, num5, num6, num7, num8, num9, num10];
  
  //for que imprime a posição e o valor de cada número da lista
  for(int i=0;i<lista.length;i++) {
    print('Posição: $i, valor: ${lista[i]}');
  }
  
}