import 'dart:math';

void main() {
  var random = Random();
  List<int> numeros = [];
  
  //for para adicionar 50 numeros na lista entre 0 e 15
  for(int i=0;i<50;i++) {
    numeros.add(random.nextInt(16));
  }

  //printa lista
  print('Lista original: $numeros');

  //remove os numeros pares da lista
  numeros.removeWhere((numero) => numero%2==0);

  //printa lista atualizada
  print('Lista atualizada: $numeros');
  
}