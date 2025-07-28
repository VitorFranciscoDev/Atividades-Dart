import 'dart:collection';
import 'dart:math';

//Tempo cronometrado: 26:22

void main() {
  //Instâncias
  final fila = Queue<String>();
  final gerador = GeradorDeNomes();

  //for para adicionar as pessoas na fila
  for(int i=0;i<10;i++) {
    String nome = gerador.gerarNome();
    fila.addLast(nome);
    print("$nome entrou na fila");
  }

  print("Atendendo as pessoas da fila.");

  //while para atender as pessoas da fila e remove-las
  while(fila.isNotEmpty) {
    final cliente = fila.removeFirst();
    print('$cliente foi atendido');
  }
}

//Classe para gerar nomes aleatórios
class GeradorDeNomes {
  final List<String> nomes = ['Ana' , 'Carlos', 'João', 'Maria', 'Lucas', 'Fernanda', 'Bruno', 'Juliana', 'Pedro', 'Larissa', 'Rafael', 'Camila', 'Gustavo', 'Bianca', 'Felipe'];
  final List<String> sobrenomes = ['Silva', 'Santos', 'Oliveira', 'Souza', 'Lima', 'Costa', 'Ferreira', 'Pereira', 'Almeida', 'Gomes', 'Rocha', 'Martins', 'Barbosa', 'Melo', 'Dias'];
  Random random = Random();

  String gerarNome() {
    final nome = nomes[random.nextInt(nomes.length)];
    final sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];
    return '$nome $sobrenome';
  }
}