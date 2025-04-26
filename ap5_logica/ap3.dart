import 'dart:math';

void main() {
  //Declaração de variáveis
  final random = Random();
  int valorAleatorio = random.nextInt(901)+100;
  int somares = somaPares(valorAleatorio);

  //Imprime a soma de todos os números pares
  print("A soma dos numeros pares entre 0 e $valorAleatorio é $somares");
}

//Função para calcular a soma de todos os números pares entre 0 e o valor aleatório
somaPares(int valor) {
  int soma=0;
  for(int i=0;i<=valor;i++) {
    if(i%2==0) {
      soma+=i;
    }
  }
  return soma;
}