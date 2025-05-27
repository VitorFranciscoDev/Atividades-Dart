void main() async {
  //Simulação de busca de dados
  print("Começando busca de dados.");

  print("Buscando dados.");
  await buscarDados();

  print("Busca de dados concluída.");
}

//Função para aguardar 5 segundos
Future<void> buscarDados() async {
  await Future.delayed(Duration(seconds: 5));
}