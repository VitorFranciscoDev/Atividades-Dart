import 'dart:math';

//Tempo cronometrado: 78:33

void main() {
  final List<Figura> figurinhas = List.generate(20, (index) => Figura("Figura ${index + 1}", index+1));
  final album = Album();

  //while para abrir os pacotes até o álbum estar completo
  while(!album.completo()) {
    PacoteDeFiguras pacote = PacoteDeFiguras(figurinhas);
    album.addPacote(pacote);
  }

  //Imprime as informações
  print("Número de figurinhas repetidas: ${album.repetidas.length}");
  album.imprimirAlbum();
}

class Figura {
  //Declaração de variáveis
  String nome;
  int codigo;
  Figura(this.nome, this.codigo);

  //Formatação
  String toString() {
    return 'Nome: $nome, Código: $codigo';
  }
}

class PacoteDeFiguras {
  Random random = Random();
  List<Figura> pacote = [];

  PacoteDeFiguras(List<Figura> figurinhas) {
    //Adiciona figurinhas aleatórias ao pacote
    for(int i=0;i<4;i++) {
      Figura figuraAleatoria = figurinhas[random.nextInt(figurinhas.length)];
      pacote.add(figuraAleatoria);
    }
  }
}

class Album {
  final Set<Figura> coladas = {};
  final List<Figura> repetidas = [];

  void addPacote(PacoteDeFiguras pacote) {
    for(var figura in pacote.pacote) {
      if(!coladas.add(figura)) {
        repetidas.add(figura);
      }
    }
  }

  bool completo() => coladas.length == 20;

  //Imprime as informações
  void imprimirAlbum() {
    final List<Figura> coladasEmOrdem = coladas.toList();
    coladasEmOrdem.sort((a, b) => a.codigo.compareTo(b.codigo));

    print("Figurinhas coladas no álbum: ");
    for(var fig in coladasEmOrdem) {
      print(fig);
    }
  }
}