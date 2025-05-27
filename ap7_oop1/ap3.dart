void main() {
  //Declaração da lista dos produtos
  List<Produto> jogos = [
  Produto("RDR2", 300.00),
  Produto("GTA V", 250.00),
  Produto("Far Cry 4", 200.00),
  Produto("Uncharted 4", 250.00),
  Produto("God of War", 200.00),
  ];
  
  //for para utilizar a função em todos os itens da lista e printa-los
  for(var jogo in jogos) {
    double novoPreco = jogo.desconto(50);
    print('Novo preço do produto ${jogo.nome} (com desconto) ${novoPreco.toStringAsFixed(2)}');
  }
}

class Produto {
  //Declaração de atributos e construtor da classe
  String nome;
  double preco;
  Produto(this.nome, this.preco);

  //Função para calcular o preço com desconto
  desconto(int percDesconto) {
    return preco - (preco*(percDesconto/100));
  }
}