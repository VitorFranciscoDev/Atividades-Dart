import 'dart:io';

void main() {
  //Pede um número ao usuário
  print("Digite um numero: ");
  String? valor = stdin.readLineSync();

  //Se valor for diferente de null, chama a função
  if(valor!=null) {
    stringInteiro(valor);
  } else {
    print("Nenhum numero digitado");
  }
}

//Função para transformar String em int
void stringInteiro (String valor) {
  try {
  int valormod = int.parse(valor);
  print(valormod);
  } catch(e) {
    print("Entrada invalida. Digite apenas números inteiros.");
  }
}