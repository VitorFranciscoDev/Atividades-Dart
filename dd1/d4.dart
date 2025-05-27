//Tempo cronometrado: 16:10

void main() {
  //Declaração da data atual + chama a função adicionarDias
  DateTime dataInicial = DateTime(2022, 9, 5);
  DateTime dataCalculada = adicionarDias(dataInicial);

  //printa a data atual e a data calculada
  print("Data atual: ${formatarData(dataInicial)}");
  print("Data calculada: ${formatarData(dataCalculada)}");
}

//Função para adicionar dias a data inicial
adicionarDias(DateTime dataInicial) {
    //Declaração das variáveis
    DateTime data = dataInicial;
    int i=0;

    //while que verifica se o contador é menor que 18
    while(i<18) {
        //adiciona um dia a data
        data = data.add(Duration(days: 1));
        
        //se o dia for diferente de sábado ou domingo, adiciona 1 ao contador
        if(data.weekday != DateTime.saturday && data.weekday != DateTime.sunday) {
            i++;
        }
    }
    return data;
}

//Método para formatar a data no formato dd/mm/yyyy
String formatarData(DateTime data) {
  String dia = data.day.toString().padLeft(2, '0');
  String mes = data.month.toString().padLeft(2, '0');
  String ano = data.year.toString();
  return "$dia/$mes/$ano";
}