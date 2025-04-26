import 'dart:math';

void main() {
  //Declaração das variáveiss
  final random = Random();
  List<int> lista1 = [];
  List<int> lista2 = [];

  //For para adicionar os números aleatórios nas listas
  for(int i=0;i<5;i++) {
    lista1.add(random.nextInt(101));
    lista2.add(random.nextInt(101)); 
  }

  //Imprime a primeira e a segunda lista
  imprimirLista(lista1);
  imprimirLista(lista2);

  //Printa as operações
  for(int i=0;i<5;i++) {
    print('${lista1[i]} + ${lista2[i]}');
  }

  //Printa a lista resultado que recebe a soma das listas
  List<int> resultado = somaLista(lista1, lista2);
  imprimirLista(resultado);
  }

  //Função para imprimir a lista na formatação certa
  void imprimirLista(List<int> lista) {
    print('Lista: ${lista.join(', ')}');
  }

  //Função para somar as duas listas
  List<int> somaLista(List<int> lista3, List<int> lista4) {
  List<int> resultado = [];
  for(int i=0;i<5;i++) {
    resultado.add(lista3[i]+lista4[i]);
  }
  return resultado;
  }