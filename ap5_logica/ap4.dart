void main() {
  //Declaração da lista
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  //Declaração de variáveis
  final nome = 'Maria';
  final quantidade = contarNome(listaNomes, nome);

  //If para verificar a quantidade de vezes que o nome aparece
  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

//Função para retornar a contagem de cada um dos nomes da lista
contarNome(List<String> listaNomes, String nome) {
  Map<String, int> contagem = {};
  for(String nome in listaNomes) {
    if(contagem.containsKey(nome)) {
      contagem[nome] = contagem[nome]!+1;
    } else {
      contagem[nome] = 1;
    }
  }
  return contagem[nome] ?? 0;
}