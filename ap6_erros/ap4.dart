void main() {
    try {
        ArquivoTexto arqtxt = new ArquivoTexto("numeros.txt");  
    try {
        arqtxt.abrir();
    } catch(e) {
        rethrow;
    }
    } catch(e) {
        print("Entrada invalida. Digite um nome valido.");
    } finally {
        print("Fim do programa");
    }
}

//Interface com método abrir
abstract class Arquivo {
    void abrir();
}

class ArquivoTexto implements Arquivo {
    //Declaração de atributos
    final String _nome;
    ArquivoTexto(this._nome);

    //Função para simular abertura de arquivo
    void abrir() {
        try {
          if(_nome.isEmpty) {
            throw Exception("Nome inválido");
          }
          print("Arquivo $_nome aberto com sucesso.");
        } catch(e) {
            throw Exception("Erro ao abrir o arquivo $_nome");
        }
    }
}