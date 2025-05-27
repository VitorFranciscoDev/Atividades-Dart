import 'dart:io';

void main() {
  //Pede um número par ao usuário
  print("Digite um numero par: ");
  String? valor = stdin.readLineSync();

  //se valor for diferente de null, faz o parse para int e chama a função
  if(valor!=null){
    int numero = int.parse(valor);
    verificador(numero);
  } else {
      print("Nenhum numero digitado");
    }
}

//Função que verifica se o número é par e caso não seja, lança uma excessão
verificador(int numero) {
  try{
    if(numero%2==0) {
      print("Entrada correta, você inseriu um numero par");
    } else {
      throw Exception("Entrada inválida. Insira apenas números pares.");
    }
  } catch(e) {
      print(e);
  }
}