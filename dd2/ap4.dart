import 'dart:math' as math;

//Tempo cronometrado: 97:09

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geometricas
  final formasGeometricas = [
    Circulo('Circulo A', 3),
    Circulo('Circulo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    Quadrado('Quadrado A', 5),
    TrianguloEquilatero('Triângulo Equilátero', 6),
    TrianguloRetangulo('Triângulo Retângulo', 3, 4),
    PentagonoRegular('Pentágono Regular', 7),
    HexagonoRegular('Hexágono Regular', 4),
  ];

  //Chamando as funções para encontrar a maior área e maior perimetro
  Forma formaArea = formasGeometricas.reduce((a, b) => comparador.formaMaiorArea(a, b));
  print("O ${formaArea.nome} possui a maior área: ${formaArea.area}");

  Forma formaPerimetro = formasGeometricas.reduce((a, b) => comparador.formaMaiorPerimetro(a, b));
  print("O ${formaPerimetro.nome} possui o maior perímetro: ${formaPerimetro.perimetro}");
}

abstract class Forma {
  final String nome;
  Forma(this.nome);

  double get area;
  double get perimetro;
}

/// Representa a forma geometrica "círculo"
class Circulo extends Forma{
  /// Construtor padrao
  Circulo(this.nome, this.raio) : super(nome);

  final String nome;
  final double raio;

  /// Retorna a area desse círculo
  double get area => math.pi * math.pow(raio, 2);

  /// Retorna o perímetro desse círculo
  double get perimetro => 2 * math.pi * raio;
}

/// Representa a forma geometrica "retângulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo extends Forma {
  /// Construtor padrao
  Retangulo(this.nome, this.altura, this.largura) : super(nome);

  final String nome;
  final double largura;
  final double altura;

  /// Retorna a area desse círculo
  double get area => altura * largura;

  /// Retorna o perímetro desse círculo
  double get perimetro => (altura * 2) + (largura * 2);
}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado extends Retangulo {
  /// Construtor padrao
  Quadrado(String nome, double lado) : super(nome, lado, lado);
}

///Representa a forma geométrica "triângulo equilátero", que é um triângulo com todos os lados possuindo as mesmas medidas
class TrianguloEquilatero extends Forma {
  ///Construtor padrão
  final double lado;
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  ///Retorna a área desse triângulo
  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  ///Retorna o perímetro desse triângulo
  double get perimetro => 3 * lado;
}

///Representa a forma geométrica "Triângulo retângulo", que é um triângulo que possui um ângulo de 90 graus
class TrianguloRetangulo extends Forma {
  ///Construtor padrão
  final double base;
  final double altura;
  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  ///Retorna a área desse triângulo
  double get area => (base * altura) / 2;

  ///Retorna o perímetro desse triângulo
  double get perimetro => base + altura + math.sqrt(base * base + altura * altura);
}

///Representa a forma geométrica "pentágono regular", que é um pentágono que possui todos os lados iguais
class PentagonoRegular extends Forma {
  ///Construtor padrão
  final double lado;
  PentagonoRegular(String nome, this.lado) : super(nome);

  ///Retorna a área desse pentágono
  double get area => (5 * math.pow(lado, 2)) / (4 * math.tan(math.pi / 5));

  ///Retorna o perímetro desse pentágono
  double get perimetro => 5 * lado;
}

///Representa a forma geométrica "hexágono regular", que é um hexágono o qual possui todos os lados iguais
class HexagonoRegular extends Forma {
  ///Construtor padrão
  final double lado;
  HexagonoRegular(String nome, this.lado) : super(nome);

  ///Retorna a área desse hexágono
  double get area => (3 * math.sqrt(3) / 2) * math.pow(lado, 2);

  ///Retorna o perímetro desse hexágono
  double get perimetro => 6 * lado;
}

/// Compara caracteristicas de formas geometricas
class ComparadorFormasGeometricas {
  Forma formaMaiorArea(Forma formaA, Forma formaB) {
    return formaA.area >= formaB.area ? formaA : formaB;
  }

  Forma formaMaiorPerimetro(Forma formaA, Forma formaB) {
    return formaA.perimetro >= formaB.perimetro ? formaA : formaB;
  }
}