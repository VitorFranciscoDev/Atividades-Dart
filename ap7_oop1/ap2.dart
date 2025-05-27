void main() {
  //Implementação do objeto
  Retangulo ret = new Retangulo(5, 6);

  //Chama o método
  ret.calcularArea();
}

class Retangulo {
  //Declaração de atributos e construtor da classe
  double largura;
  double altura;
  Retangulo(this.largura, this.altura);

  //Função para calcular área
  void calcularArea() {
    double area = largura*altura;
    print("Area do retângulo: $area");
  }
}