import 'dart:math';

//Tempo cronometrado: 08:57

void main() {
  //Declaração das Lists
  List<String> nomes = ["Ana", "Francisco", "Joao", "Pedro", "Gabriel", "Rafaela", "Marcio", "Jose", "Carlos", "Patricia", "Helena", "Camila", "Mateus", "Gabriel", "Maria", "Samuel", "Karina", "Antonio", "Daniel", "Joel", "Cristiana", "Sebastião", "Paula"];
  List<String> sobrenomes = ["Silva", "Ferreira", "Almeida", "Azevedo", "Braga", "Barros", "Campos", "Cardoso", "Teixeira", "Costa", "Santos", "Rodrigues", "Souza", "Alves", "Pereira", "Lima", "Gomes", "Ribeiro", "Carvalho", "Lopes", "Barbosa"];
  var random = Random();

  //Atribui valores aleatórios das listas para nome e sobrenome
  String nome = nomes[random.nextInt(nomes.length)];
  String sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];

  //printa nome e sobrenome da pessoa
  print("Nome: $nome $sobrenome");
}