//Tempo cronometrado: 09:52

void main() {
  //Declaração da lista de números
  List<int> numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];
  numeros.sort(); //ordena por ordem crescente

  //for para transformar os numeros em decimal, binario, octal e hexadecimal e printa-los
  for(var numero in numeros) {
    var decimal = transformarDecimal(numero);
    var binario = transformarBinario(numero);
    var octal = transformarOctal(numero);
    var hexadecimal = transformarHexadecimal(numero);

    print("decimal: $decimal, binário: $binario, octal: $octal, hexadecimal: $hexadecimal");
  }
}

//Funções para transformar o número em decimal, binario, octal e hexadecimal
transformarDecimal(int numero) => numero.toString();

transformarBinario(int numero) => numero.toRadixString(2);

transformarOctal(int numero) => numero.toRadixString(8);

transformarHexadecimal(int numero) => numero.toRadixString(16);