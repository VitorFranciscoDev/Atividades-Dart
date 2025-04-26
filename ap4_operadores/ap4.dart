void main() {
  //Chama a função desconto e passa os parâmetros
  desconto(100, 50);
}

//Função para calcular o desconto dado por meio de uma regra de 3
desconto(int valorprod, int valordesc) {
  double x;
  x=(valordesc*100)/valorprod;
  x=100-x;

  print("O produto custava $valorprod reais, foi vendido por $valordesc reais. O desconto dado foi ${x.toInt()}%.");
}