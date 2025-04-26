void main() {
  //Chama a função ehAnoBissexto 6 vezes e passa 6 parâmetros diferentes
  ehAnoBissexto(2016);
  ehAnoBissexto(1988);
  ehAnoBissexto(2000);
  ehAnoBissexto(2100);
  ehAnoBissexto(2300);
  ehAnoBissexto(1993);
}

//Função para verificar se o ano é bissexto ou não
void ehAnoBissexto(int ano) {
  if((ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0)) {
    print("O ano $ano eh bissexto");
  } else {
      print("O ano $ano nao eh bissexto");
    }
}