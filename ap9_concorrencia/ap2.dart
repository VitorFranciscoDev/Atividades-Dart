Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  await baixarImagens(urls);
}

//Função para simular o download de imagens
Future<void> baixarImagens(List<String> urls) async {
  print("Baixando imagens...");

  //for para aguardar 2 segundos e printar o sucesso no download da imagem
  for(String url in urls) {
    await Future.delayed(Duration(seconds: 2));
    print("Imagem $url baixada com sucesso!");
  }

  print("Download concluído com sucesso");
}