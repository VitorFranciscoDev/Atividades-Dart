import 'dart:math';

void main() {
  //resB recebe A passando B como parâmetro e resC recebe A passando C como parâmetro
  int resB = A(B);
  int resC = A(C);

  //Imprime os dois resultados
  print("Resultado de A passando B: $resB");
  print("Resultado de A passando C: $resC");
}

//Recebe uma função como parâmetro e retorna a soma dessa função executada duas vezes
int A(int Function(int) func) {
  final random = Random();
  int num1 = random.nextInt(100);
  int num2 = random.nextInt(100);
  return func(num1) + func(num2);
}

//Recebe um número e retorna o número*2
int B(int num) {
  return num*2;
}

//Recebe um número e retorna o número+5
int C(int num) {
  return num+5;
}