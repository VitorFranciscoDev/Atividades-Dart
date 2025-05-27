Future<void> main() async {
  print("Iniciando lançamento");

  //for onde o índice i é o contador para o lançamento do foguete
  for(int i=5;i>0;i--) {
    print(i);
    await Future.delayed(Duration(seconds: 1));
  }

  print("Foguete lançado!");
}