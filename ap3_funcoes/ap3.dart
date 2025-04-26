import 'dart:math';

void main() {
  //Declaração das variáveis
  final random = Random();
  List<int> raios = [];

  //For para adicionar 10 raios aleatórios
  for(int i=0;i<10;i++) {
    raios.add(random.nextInt(100)+1);
  }

  //Listas recebem as áreas e perímetros retornados das funções
  List<double> areas = calcularArea(raios);
  List<double> perimetros = calcularPerimetro(raios);

  //Imprime o raio e sua respectiva área e perímetro
  for(int i=0;i<raios.length;i++) {
    print("Raio: ${raios[i]}, area: ${areas[i].toStringAsFixed(2)}, perímetro: ${perimetros[i].toStringAsFixed(2)}");
  }
}

  //Função para calcular área com base na fórmula
  calcularArea(List<int> raios) {
    List<double> areas = [];
    for(int i=0;i<raios.length;i++) {
      areas.add(3.14*(raios[i]*raios[i]));
    }
    return areas;
  }

  //Função para calcular perímetro com base na fórmula
  calcularPerimetro(List<int> raios) {
    List<double> perimetros = [];
    for(int i=0;i<raios.length;i++) {
      perimetros.add(2*3.14*raios[i]);
    }
    return perimetros;  
  }