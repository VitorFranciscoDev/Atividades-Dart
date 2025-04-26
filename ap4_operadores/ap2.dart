void main() {
  //Declaração das listas
  List<String> numeros = ["10", "2XXL7", "JOJ0", "99", "381", "AD44", "47", "2B", "123", "78"];
  List<int> numerosconv = converterNumero(numeros);

  //Imprime a lista convertida
  print("Lista convertida: ${numerosconv.join(", ")}");
}

//Função para converter a String para int
converterNumero(List<String> numeros) {
  List<int> numerosconv = [];
  for(String numero in numeros) {
    try {
      numerosconv.add(int.parse(numero));
    } catch(_) {
        numerosconv.add(0);
      }
  }
  return numerosconv;
}