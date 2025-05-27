import 'dart:math';

void main() {
  //Dando valor as variáveis
  final random = Random();
  final nome = "Vitor";
  final idade = random.nextInt(100)+1;
  double altura = 1.0 + random.nextDouble() * (2.3 - 1.0);

  //Implementação do objeto
  Pessoa pessoa = Pessoa(nome, idade, altura);

  //printa as informações da pessoa
  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade}");
  print("Altura: ${pessoa.altura.toStringAsFixed(2)}");
}

class Pessoa {
  //Declaração de atributos e construtor da classe
  String _nome;
  int _idade;
  double _altura;
  Pessoa(this._nome, this._idade, this._altura);

  //setter para idade que verifica se a idade é maior ou igual a 0
  set idade(int id) {
    if(id>=0) {
      _idade = id;
    } else {
      throw ArgumentError("Idade invalida");
    }
  }
  
  //getter dos atributos
  int get idade => _idade;
  String get nome => _nome;
  double get altura => _altura;
}