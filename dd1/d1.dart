import 'dart:math';

//Tempo cronometrado: 7:29

void main() {
  //Declaração das listas
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];
  List<double> areas = [];
  List<double> perimetros = [];

  //for para calcular a área e perímetro de todos os raios e adiciona-los em listas
  for(var raio in raios) {
  areas.add(calcularArea(raio));
  perimetros.add(calcularPerimetro(raio));
  }

  //for para printar a área e perímetro de cada raio
  for(int i=0; i<raios.length;i++) {
  print("Raio: ${raios[i]}, area: ${areas[i].toStringAsFixed(2)}, perímetro: ${perimetros[i].toStringAsFixed(2)}");
  }
}

//Método para calcular área
calcularArea(double raio) {
  double area = pi*(raio*raio);
  return area;
}

//Método para calcular perímetro
calcularPerimetro(double raio) {
  double perimetro = 2*pi*raio;
  return perimetro;
}