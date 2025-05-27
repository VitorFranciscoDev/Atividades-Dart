import 'dart:math';

void main() {
    //Declara dois números randoms entre 0.0 e 99.0
    final random = Random();
    double ran1 = random.nextDouble()*99.1;
    double ran2 = random.nextDouble()*99.1;

    //Chama a função para calcular a área do retângulo
    try{
        Retangulo ret = new Retangulo(ran1, ran2);
        ret.calcularArea();
    } catch(e) {
        print("Erro: $e");
    }
}

abstract class Forma {
    void calcularArea();
}

class Retangulo implements Forma {
    //Declaração de atributos
    double _base;
    double _altura;
    
    //Construtor da classe com if para checar se base e altura são maiores que 0
    Retangulo(this._base, this._altura) {
        if(_base<=0 || _altura<=0) {
            throw Exception("Dimensões inválidas, informe apenas valores positivos maiores que zero");
        }
    }
    
    //Função para calcular a área
    void calcularArea() {
        double area = _altura * _base;
        print("Area do retângulo: ${area.toStringAsFixed(2)}");
    }
}