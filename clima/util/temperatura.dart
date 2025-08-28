import 'dart:io';
import 'dart:convert';
import 'package:yaansi/yaansi.dart';

//Enum com todos os meses
enum Meses {
  Janeiro,
  Fevereiro,
  Marco,
  Abril,
  Maio,
  Junho,
  Julho,
  Agosto,
  Setembro,
  Outubro,
  Novembro,
  Dezembro
}

class Temperatura {
  //Lista com arquivos
  List<String> sc = List.generate(12, (i) => "sensores/SC_2024_${i+1}.csv");
  List<String> sp = List.generate(12, (i) => "sensores/SP_2024_${i+1}.csv");

  //Lista de temperaturas do ano
  List<double> tempAnoSC = [];
  List<double> tempAnoSP = [];

  //Maps para as médias de horário por estado
  Map<int, List<double>> horasAnoSC = {};
  Map<int, List<double>> horasAnoSP = {};

  Future<void> relatorio() async {
    for(int i=0;i<12;i++) {
      //Lê os arquivos de SC e SP
      final fileSC = File(sc[i]);
      final fileSP = File(sp[i]);
      
      //Verifica se os arquivos existem
      if(await fileSC.exists() && await fileSP.exists()) {
        //Santa Catarina
        final bytesSC = await fileSC.readAsBytes(); //Transforma em bytes
        final conteudoSC = latin1.decode(bytesSC); //Converte os bytes
        final linhasSC = const LineSplitter().convert(conteudoSC).skip(1); //Transforma em linhas e pula a primeira(cabeçário)

        List<double> tempMesSC = []; //Lista do mês de SC
        for(var linhaSC in linhasSC) {
          final partesSC = linhaSC.split(","); //Armazena as partes da linha em um List
          if(partesSC.length==8) {
            final horaSC = int.parse(partesSC[2]);
            final temperaturaSC = double.parse(partesSC[3]); //Armazena a temperatura

            //Adiciona as temperaturas de SC nas Lists
            tempMesSC.add(temperaturaSC);
            tempAnoSC.add(temperaturaSC);

            //Adiciona as temperaturas no Map
            horasAnoSC.putIfAbsent(horaSC, () => []).add(temperaturaSC);
          }
        }

        //São Paulo
        final bytesSP = await fileSP.readAsBytes(); //Transforma em bytes
        final conteudoSP = latin1.decode(bytesSP); //Converte os bytes
        final linhasSP = const LineSplitter().convert(conteudoSP).skip(1); //Transforma em linhas e pula a primeira(cabeçário)

        List<double> tempMesSP = []; //Lista do mês de SP
        for(var linhaSP in linhasSP) {
          final partesSP = linhaSP.split(","); //Armazena as partes da linha em um List
          if(partesSP.length==8) {
            final horaSP = int.parse(partesSP[2]);
            final temperaturaSP = double.parse(partesSP[3]); //Armazena a temperatura

            //Adiciona as temperaturas de SP nas Lists
            tempMesSP.add(temperaturaSP);
            tempAnoSP.add(temperaturaSP);

            //Adiciona as temperaturas no Map
            horasAnoSP.putIfAbsent(horaSP, () => []).add(temperaturaSP);
          }
        }
      
      //Faz as médias mensais de SC e SP
      final mediaMesSC = tempMesSC.reduce((a, b) => a + b) / tempMesSC.length;
      final mediaMesSP = tempMesSP.reduce((a, b) => a + b) / tempMesSP.length;

      //Coloca as Lists em ordem crescente
      tempMesSC.sort();
      tempMesSP.sort();
      
      //Chama a função para formatar a temperatura e mostra-la em outras unidades
      formatarTemperaturaMes(Meses.values[i], mediaMesSP, mediaMesSC, tempMesSC, tempMesSP);

      } else {
        print("Falha ao ler arquivo");
      }
    }

    //Faz as médias anuais de SC e SP
    final mediaAnoSC = tempAnoSC.reduce((a, b) => a + b) / tempAnoSC.length;
    final mediaAnoSP = tempAnoSP.reduce((a, b) => a + b) / tempAnoSP.length;

    //Coloca as Lists em ordem crescente
    tempAnoSC.sort();
    tempAnoSP.sort();

    formatarTemperaturaAno(mediaAnoSP, mediaAnoSC, tempAnoSC, tempAnoSP, horasAnoSC, horasAnoSP);
    await salvarRelatorio("CLIMA", _conteudo.toString());
  }

  final StringBuffer _conteudo = StringBuffer();

  void printt(String texto) {
    print(texto);
    _conteudo.writeln(texto); //Adiciona no Buffer
  }

  //Função para salvar o relatório como arquivo .txt
  Future<void> salvarRelatorio(String tipo, String conteudo) async {
    final atual = DateTime.now();
    final data = "${atual.year}-${atual.month.toString().padLeft(2, '0')}-${atual.day.toString().padLeft(2, '0')}";
    final hora = "${atual.hour.toString().padLeft(2, '0')}-${atual.minute.toString().padLeft(2, '0')}";

    final nomeArquivo = "${tipo}_${data}_${hora}.txt";
    final arquivo = File(nomeArquivo);

    await arquivo.writeAsString(conteudo, mode: FileMode.write);
    print("Relatório salvo;");
  }

  //Função para pegar as variáveis necessárias e printa-las(mês)
  void formatarTemperaturaMes(Meses mes, double mediaMesSP, double mediaMesSC, List<double> tempMesSC, List<double> tempMesSP) {
    //Média dos dois estados em Farenheit e Kelvin
    final mediaScF = (mediaMesSC*1.8) + 32;
    final mediaSpF = (mediaMesSP*1.8) + 32;
    final mediaScK = mediaMesSC + 273.15;
    final mediaSpK = mediaMesSP + 273.15;

    //Máxima dos dois estados em Farenheit e Kelvin 
    final maximaScF = (tempMesSC.last*1.8) + 32;
    final maximaSpF = (tempMesSP.last*1.8) + 32;;
    final maximaScK = tempMesSC.last + 273.15;
    final maximaSpK = tempMesSP.last + 273.15;

    //Mínima dos dois estados em Farenheit e Kelvin
    final minimaScF = (tempMesSC.first*1.8) + 32;
    final minimaSpF = (tempMesSP.first*1.8) + 32;
    final minimaScK = tempMesSC.first + 273.15;
    final minimaSpK = tempMesSP.first + 273.15;

    printt('''
${mes.name[0].toUpperCase()}${mes.name.substring(1)}

Santa Catarina
Média: ${red("${mediaMesSC.toInt()}°C")}, ${yellow("${mediaScF.toInt()}F")}, ${blue("${mediaScK.toInt()}K")}
Máxima: ${red("${tempMesSC.last.toInt()}°C")}, ${yellow("${maximaScF.toInt()}F")}, ${blue("${maximaScK.toInt()}K")}
Mínima: ${red("${tempMesSC.first.toInt()}°C")}, ${yellow("${minimaScF.toInt()}F")}, ${blue("${minimaScK.toInt()}K")}

São Paulo
Média: ${red("${mediaMesSP.toInt()}°C")}, ${yellow("${mediaSpF.toInt()}F")}, ${blue("${mediaSpK.toInt()}K")}
Máxima: ${red("${tempMesSP.last.toInt()}°C")}, ${yellow("${maximaSpF.toInt()}F")}, ${blue("${maximaSpK.toInt()}K")}
Mínima: ${red("${tempMesSP.first.toInt()}°C")}, ${yellow("${minimaSpF.toInt()}F")}, ${blue("${minimaSpK.toInt()}K")}
    ''');
  }

  //Função para pegar as variáveis necessárias e printa-las(ano)
  void formatarTemperaturaAno(double mediaAnoSP, double mediaAnoSC, List<double> tempAnoSC, List<double> tempAnoSP, Map<int, List<double>> horasAnoSC, Map<int, List<double>> horasAnoSP) {
    //Média dos dois estados em Farenheit e Kelvin
    final mediaScF = (mediaAnoSC*1.8) + 32;
    final mediaSpF = (mediaAnoSP*1.8) + 32;
    final mediaScK = mediaAnoSC + 273.15;
    final mediaSpK = mediaAnoSP + 273.15;

    //Máxima dos dois estados em Farenheit e Kelvin 
    final maximaScF = (tempAnoSC.last*1.8) + 32;
    final maximaSpF = (tempAnoSP.last*1.8) + 32;;
    final maximaScK = tempAnoSC.last + 273.15;
    final maximaSpK = tempAnoSP.last + 273.15;

    //Mínima dos dois estados em Farenheit e Kelvin
    final minimaScF = (tempAnoSC.first*1.8) + 32;
    final minimaSpF = (tempAnoSP.first*1.8) + 32;
    final minimaScK = tempAnoSC.first + 273.15;
    final minimaSpK = tempAnoSP.first + 273.15;

    printt('''
Relatório Anual

Santa Catarina
Média: ${red("${mediaAnoSC.toInt()}°C")}, ${yellow("${mediaScF.toInt()}F")}, ${blue("${mediaScK.toInt()}K")}
Máxima: ${red("${tempAnoSC.last.toInt()}°C")}, ${yellow("${maximaScF.toInt()}F")}, ${blue("${maximaScK.toInt()}K")}
Mínima: ${red("${tempAnoSC.first.toInt()}°C")}, ${yellow("${minimaScF.toInt()}F")}, ${blue("${minimaScK.toInt()}K")}

São Paulo
Média: ${red("${mediaAnoSP.toInt()}°C")}, ${yellow("${mediaSpF.toInt()}F")}, ${blue("${mediaSpK.toInt()}K")}
Máxima: ${red("${tempAnoSP.last.toInt()}°C")}, ${yellow("${maximaSpF.toInt()}F")}, ${blue("${maximaSpK.toInt()}K")}
Mínima: ${red("${tempAnoSP.first.toInt()}°C")}, ${yellow("${minimaSpF.toInt()}F")}, ${blue("${minimaSpK.toInt()}K")}
    ''');

    printt('''
Médias por horas

Santa Catarina
    ''');

    //Mostra as médias por hora(SC)
    for(int i=1;i<=24;i++) {
      if(horasAnoSC.containsKey(i)) {
        final mediaSC = horasAnoSC[i]!.reduce((a, b) => a + b) / horasAnoSC[i]!.length;

        //Média da hora em Farenheit e Kelvin
        final mediaSCF = (mediaSC*1.8) + 32;
        final mediaSCK = mediaSC + 273.15;

        printt('''
Hora: $i, Média: ${red("${mediaSC.toInt()}°C")}, ${yellow("${mediaSCF.toInt()}F")}, ${blue("${mediaSCK.toInt()}K")}
        ''');
      }
    }

    printt('''
São Paulo
    ''');

    //Mostra as médias por hora(SP)
    for(int i=1;i<=24;i++) {
      if(horasAnoSP.containsKey(i)) {
        final mediaSP = horasAnoSP[i]!.reduce((a, b) => a + b) / horasAnoSP[i]!.length;

        //Média da hora em Farenheit e Kelvin
        final mediaSPF = (mediaSP*1.8) + 32;
        final mediaSPK = mediaSP + 273.15;

        printt('''
Hora: $i, Média: ${red("${mediaSP.toInt()}°C")}, ${yellow("${mediaSPF.toInt()}F")}, ${blue("${mediaSPK.toInt()}K")}
        ''');
      }
    }
  }
}