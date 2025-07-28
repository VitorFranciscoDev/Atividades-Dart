//Tempo cronometrado: 43:59

void main() {
  //Declaração da lista
  List<Musica> musicas = [
    Musica("Love of My Life", "Queen", "A Night At The Opera", 217),
    Musica("Beat It", "Michael Jackson", "Thriller", 258),
    Musica("Count Me Out", "Kendrick Lamar", "Mr. Morale and The Big Steppers", 283),
    Musica("Impossible", "Travis Scott", "Rodeo", 242)
  ];

  //printa as músicas cadastradas
  print("Músicas cadastradas:");
  musicas.forEach(print);
  
  //printa o número de músicas
  print("Número de músicas: ${musicas.length}");

  //printa a duração de todas as músicas somadas em segundos
  double somaDuracao = 0;
  for(var musica in musicas) {
    somaDuracao+=musica.duracao;
  }
  somaDuracao = somaDuracao/3600;
  print("Duração de todas as músicas: $somaDuracao");

  //Chama os métodos de busca de músicas
  Biblioteca.musicaPorTitulo("Love of My Life", musicas);
  Biblioteca.musicaPorArtista("Michael Jackson", musicas);
  Biblioteca.musicaPorAlbum("Rodeo", musicas);
}

class Musica {
  //Declaração de variáveis
  String titulo;
  String artista;
  String album;
  int duracao;
  Musica(this.titulo, this.artista, this.album, this.duracao);

  //Formatação para printar as informações da música
  String toString() {
    return "$titulo / $artista / $album / $duracao";
  }
}

//Classe que possui os métodos de busca de músicas
class Biblioteca {
  
  //Procura músicas por título
  static void musicaPorTitulo(String titulo, List<Musica> musicas) {
    for(var musica in musicas) {
      if(musica.titulo == titulo) {
        print("Título encontrado: $musica");
      }
    }
  }

  //Procura músicas por artista
  static void musicaPorArtista(String artista, List<Musica> musicas) {
    for(var musica in musicas) {
      if(musica.artista == artista) {
        print("Música do artista encontrada: $musica");
      }
    }
  }

  //Procura músicas por álbum
  static void musicaPorAlbum(String album, List<Musica> musicas) {
    for(var musica in musicas) {
      if(musica.album == album) {
        print("Música do álbum encontrada: $musica");
      }
    }
  }
}