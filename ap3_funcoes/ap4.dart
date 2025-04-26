import 'dart:math';

void main() {
  //Declaração da lista
  var random = Random();
  List<int> numeros = [];

  //For para adicionar números aleatórios na lista
  for(int i=0;i<15;i++) {
    numeros.add(random.nextInt(5000)+1);
  }
  
  //Organiza os números em ordem crescente
  numeros.sort();

  //For para chamar as funções e imprimir o decimal, binário, octal e hexadecimal de cada número da lista
  for(int numero in numeros) {
      String decimal = converterDecimal(numero);
      String binario = converterBinario(numero);
      String octal = converterOctal(numero);
      String hexadecimal = converterHexadecimal(numero);

      print('decimal: $decimal, binário: $binario, octal: $octal, hexadecimal: $hexadecimal');
  }
}

//Funções para transformar o número em decimal, binário, octal e hexadecimal
converterDecimal(int numero) => numero.toString();

converterBinario(int numero) => numero.toRadixString(2);

converterOctal(int numero) => numero.toRadixString(8);

converterHexadecimal(int numero) => numero.toRadixString(16);