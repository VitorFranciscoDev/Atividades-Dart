void main() {
  //Declaração das listas
  List<int> numeros = [1, 2, 3, 4, 5];
  List<int> listamod = removerElemento(numeros, elemento: 5);

  //Imprime a lista
  print(listamod);
}

//Função para remover o elemento da lista
removerElemento(List<int> ?lista, {int ?elemento}) {
  return (lista ?? []).where((e) => e != elemento).toList();
}