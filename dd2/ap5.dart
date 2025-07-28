import 'dart:math';

//Tempo cronometrado: 39:33

void main() {
  //Instâncias
  Random random = Random();
  Lista lista = Lista();

  //Adicionando itens na lista
  lista.adicionarItem("Camisa", 3, true, true);
  lista.adicionarItem("Chinelo", 1, true, true);
  lista.adicionarItem("Shorts", 2, false, false);
  lista.adicionarItem("Tênis", 1, false, true);
  lista.adicionarItem("Casaco", 2, false, true);

  print("Lista de compras:");
  for(var item in lista.itens) {
    print(item);
  }

  print("Retirando itens sem estoque ou já comprados.");
  lista.separarItens();

  print("Lista modificada:");
  for(var item in lista.itens) {
    print(item);
  }

  print("Comprando itens.");

  //while para remover os itens comprados
  while(lista.itens.isNotEmpty) {
    int indice = random.nextInt(lista.itens.length);
    Item itemAleatorio = lista.itens[indice];

    //for para printar o progresso da compra do item
    for(int i=0;i<=itemAleatorio.quantidade;i++) {
      print("Progresso: $i/${itemAleatorio.quantidade}");
    }

    print("Compra de item concluída com sucesso.");
    lista.itens.removeAt(indice);
  }
}

class Item {
  //Atributos da classe Item
  String nome;
  int quantidade;
  bool comprado;
  bool estoque;
  Item(this.nome, this.quantidade, this.comprado, this.estoque);

  String toString() {
    return 'Nome: $nome, Quantidade: $quantidade';
  }
}

class Lista {
  List<Item> itens = [];

  //Função para adicionar um item na lista
  void adicionarItem(String nome, int quantidade, bool comprado, bool estoque) {
    itens.add(Item(nome, quantidade, comprado, estoque));
  }

  //Função para retirar itens comprados e sem estoque da lista
  void separarItens() {
    itens.removeWhere((item) => item.comprado || item.estoque == false);
  }
}