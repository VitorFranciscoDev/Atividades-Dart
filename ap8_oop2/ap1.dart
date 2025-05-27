import 'dart:math';

void main() {
  final random = Random();
  final generos = GeneroMusical.values;

  //Atribui um gênero musical aleatório a variável com base no Enum
  final genero = generos[random.nextInt(generos.length)];
  print("Meu genero musical preferido e o ${genero.name}");
}

//Enum que nomeia gêneros musicais
enum GeneroMusical {
  Rap,
  Rock,
  Jazz,
  Pop,
  Sertanejo,
  Country,
  RnB,
}