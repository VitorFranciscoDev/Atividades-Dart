import 'dart:math';

//Tempo cronometrado: 47:01

void main() {
  final pessoa = Pessoa();
  int contRefeicao = 0;

  // Consumindo produtos fornecidos
  while(pessoa._caloriasConsumidas<=1800) {
    final fornecedor = FornecedorAleatorio.fornecedorAleatorio();
    pessoa.refeicao(fornecedor);
    contRefeicao++;
  }

  pessoa.informacoes();
  print("Quantidade de refeições: $contRefeicao");
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

class FornecedorAleatorio {
  static final _random = Random();
  static final _fornecedores = [
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorDeUltraCaloricos(),
  ];

  //retorna um fornecedor aleatório da lista _fornecedores
  static fornecedorAleatorio() {
    return _fornecedores[_random.nextInt(_fornecedores.length)];
  }
}

//classe abstrata que possui o método fornecer
abstract class Fornecedor {
  Produto fornecer();
}

class FornecedorDeBebidas implements Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiches implements Fornecedor {
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('Misto', 150),
    Produto('Mortadela', 100),
    Produto('Salada', 50),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeBolos implements Fornecedor {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Chocolate', 300),
    Produto('Morango', 200),
    Produto('Cenoura', 250),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorDeSaladas implements Fornecedor {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('Alface', 20),
    Produto('Tomate', 30),
    Produto('Couve', 15),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos implements Fornecedor {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('Coxinha', 100),
    Produto('Pastel', 75),
    Produto('Torresmo', 75),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorDeUltraCaloricos implements Fornecedor {
  final _random = Random();
  final _ultracaloricosDisponiveis = <Produto>[
    Produto('Hambúrguer', 600),
    Produto('Pizza', 500),
    Produto('Pasta de amendoim', 400),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer() {
    return _ultracaloricosDisponiveis[_random.nextInt(_ultracaloricosDisponiveis.length)];
  }
}

class Pessoa {
  // Acumulador de calorias
  final random = Random();
  int _caloriasConsumidas;

  //inicializa calorias consumidas com um número entre 0 e 300
  Pessoa() : _caloriasConsumidas = Random().nextInt(301);

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
    if(_caloriasConsumidas<=500) {
      print("Deficit extremo de calorias");
    } else if(_caloriasConsumidas>500 && _caloriasConsumidas<=1800) {
      print("Deficit de calorias");
    } else if(_caloriasConsumidas>1800 && _caloriasConsumidas<=2500) {
      print("Pessoa está satisfeita");
    } else {
      print("Excesso de calorias");
    }
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
  }
}