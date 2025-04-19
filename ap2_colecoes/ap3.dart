import 'dart:math';

void main() {
  var random = Random();
  List <int> numeros = [];

  //for para adicionar 50 números entre 10 e 21 na lista
  for(int i=0;i<50;i++) {
    numeros.add(random.nextInt(12)+10);
  }

  //printa lista
  print('Lista original: $numeros');

  //declaração de nova lista "unicos" e for para adicionar os numeros unicos na lista
  List<int> unicos = [];
  for(int num in numeros) {
    if(!unicos.contains(num)) {
      unicos.add(num);
    }
  }
  
  //printa lista dos unicos
  print('Lista atualizada: $unicos');

}