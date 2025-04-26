void main() {
  //Lista recebe o retorno de zeroAteValor
  List<int> impares = zeroAteValor(100);

  //For para imprimir os números ímpares na formatação certa
  for(int numero in impares) {
    print("Impar: $numero");
  }
}

//Função para guardar todos os números ímpares até o valor numa lista
zeroAteValor(int valor) {
  List<int> impares = [];
  for(int i=1;i<=valor;i+=2) {
    impares.add(i);
  }
  return impares;
}