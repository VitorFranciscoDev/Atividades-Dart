//Tempo cronometrado: 31:49

void main() {
    //Declaração do atributo
    String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";

    //printa / chama funções
    print("parágrafo: $paragrafo");
    numPalavras(paragrafo);
    print("Tamanho do texto: ${paragrafo.length}");
    numFrases(paragrafo);
    numVogais(paragrafo);
    consEncontradas(paragrafo);
}

//Função para verificar o número de palavras
numPalavras(String paragrafo) {
    String par = paragrafo.trim();
    List<String> palavras = par.split(RegExp(r'\s+'));
    print("Numero de palavras: ${palavras.length}");
}

//Função para verificar o número de frases
numFrases(String paragrafo) {
    int numFrases = paragrafo
    .split(RegExp(r'[.!?]+'))
    .map((f) => f.trim())
    .where((f) => f.isNotEmpty)
    .length;

    print("Numero de frases: $numFrases");
}

//Função para verificar o número de vogais
numVogais(String paragrafo) {
    List<String> vogais = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"];
    int contvogal = 0;

    for(var caractere in paragrafo.split('')) {
        if(vogais.contains(caractere)) {
            contvogal++;
        }
    }

    print("Numero de vogais: $contvogal");
}

//Função para verificar o número de consoantes encontradas
consEncontradas(String paragrafo) {
    List<String> vogais = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"];
    Set<String> consoantes = {};

    for(var caractere in paragrafo.split("")) {
        String c = caractere.toLowerCase();
        if(!vogais.contains(c) && RegExp(r'[a-z]').hasMatch(c)) {
            consoantes.add(c);
        }
    }

    List<String> cons = consoantes.toList();
    cons.sort();
    print("Consoantes encontradas: ${cons.join(", ")}");
}