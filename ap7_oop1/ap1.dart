void main() {
  //Implementação do objeto
  ContaBancaria conta = new ContaBancaria("Vitor", 2300.75);

  //Chama as funções
  conta.depositarDinheiro(500.00);
  conta.sacarDinheiro(300.75);
}

class ContaBancaria {
  //Declaração de atributos e construtor da classe
  String titular;
  double saldo;
  ContaBancaria(this.titular, this.saldo);

  //Função para sacar o dinheiro
  void sacarDinheiro(double valor) {
    saldo = saldo-valor;
    print("Saldo atual: $saldo");
  }

  //Função para depositar o dinheiro
  void depositarDinheiro(double valor) {
    saldo = saldo+valor;
    print("Saldo atual: $saldo");
  }
}