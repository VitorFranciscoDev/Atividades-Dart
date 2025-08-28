import 'dart:io';
import 'dart:convert';
import 'dart:math';
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

class DirecaoVento {
  //Lista com arquivos
  List<String> sc = List.generate(12, (i) => "sensores/SC_2024_${i+1}.csv");
  List<String> sp = List.generate(12, (i) => "sensores/SP_2024_${i+1}.csv");

  //Lista com as direções do vento do ano
  List<double> ventoAnoSC = [];
  List<double> ventoAnoSP = [];

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

        List<double> ventoMesSC = []; //Lista do mês de SC
        for(var linhaSC in linhasSC) {
          final partesSC = linhaSC.split(","); //Armazena as partes da linha em um List
          if(partesSC.length==8) {
            final ventoSC = double.parse(partesSC[7]); //Armazena os graus da direção do vento

            //Adiciona as direções do vento de SC nas Lists
            ventoMesSC.add(ventoSC);
            ventoAnoSC.add(ventoSC);
          }
        }

        //São Paulo
        final bytesSP = await fileSP.readAsBytes(); //Transforma em bytes
        final conteudoSP = latin1.decode(bytesSP); //Converte os bytes
        final linhasSP = const LineSplitter().convert(conteudoSP).skip(1); //Transforma em linhas e pula a primeira(cabeçário)

        List<double> ventoMesSP = []; //Lista do mês de SP
        for(var linhaSP in linhasSP) {
          final partesSP = linhaSP.split(","); //Armazena as partes da linha em um List
          if(partesSP.length==8) {
            final ventoSP = double.parse(partesSP[7]); //Armazena os graus da direção do vento

            //Adiciona as direções do vento de SP nas Lists
            ventoMesSP.add(ventoSP);
            ventoAnoSP.add(ventoSP);
          }
        }

        direcaoFrequenteMes(Meses.values[i], ventoMesSC, ventoMesSP);
      } else {
        print("Falha ao ler arquivo");
      }
    }

    direcaoFrequenteAno(ventoAnoSC, ventoAnoSP);
    await salvarRelatorio("VENTO", _conteudo.toString());
  }

  final StringBuffer _conteudo = StringBuffer();

  void printt(String texto) {
    print(texto);
    _conteudo.writeln(texto); //Adiciona no Buffer
  }

  //Função para salvar o relatório num .txt
  Future<void> salvarRelatorio(String tipo, String conteudo) async {
    final atual = DateTime.now();
    final data = "${atual.year}-${atual.month.toString().padLeft(2, '0')}-${atual.day.toString().padLeft(2, '0')}";
    final hora = "${atual.hour.toString().padLeft(2, '0')}-${atual.minute.toString().padLeft(2, '0')}";

    final nomeArquivo = "${tipo}_${data}_${hora}.txt";
    final arquivo = File(nomeArquivo);

    await arquivo.writeAsString(conteudo, mode: FileMode.write);
    print("Relatório salvo;");
  }

  //Função para transformar graus em radianos
  double grausRadianos(double graus) => graus * pi / 180;

  //Função para pegar a direção do vento mais frequente de cada mês
  void direcaoFrequenteMes(Meses mes, List<double> ventoMesSC, List<double> ventoMesSP) {
    //SC
    Map<double, int> contagemSC = ventoMesSC.fold({}, (mapa, temp) {
      mapa[temp] = (mapa[temp] ?? 0) + 1;
      return mapa;
    });
    var maiorContSC = contagemSC.entries.reduce((a, b) => a.value > b.value ? a : b);

    //SP
    Map<double, int> contagemSP = ventoMesSP.fold({}, (mapa, temp) {
      mapa[temp] = (mapa[temp] ?? 0) + 1;
      return mapa;
    });
    var maiorContSP = contagemSP.entries.reduce((a, b) => a.value > b.value ? a : b);

    printt('''
${mes.name[0].toUpperCase()}${mes.name.substring(1)}

Santa Catarina

Direção do vento com maior frequência: ${yellow("${maiorContSC.key.toStringAsFixed(2)}°, ${grausRadianos(maiorContSC.key).toStringAsFixed(2)} rad")}

São Paulo

Direção do vento com maior frequência: ${yellow("${maiorContSP.key.toStringAsFixed(2)}°, ${grausRadianos(maiorContSP.key).toStringAsFixed(2)} rad")}
    ''');
  }

  //Função para pegar a direção do vento mais frequente do ano
  void direcaoFrequenteAno(List<double> ventoAnoSC, List<double> ventoAnoSP) {
    //SC
    Map<double, int> contagemSC = ventoAnoSC.fold({}, (mapa, temp) {
      mapa[temp] = (mapa[temp] ?? 0) + 1;
      return mapa;
    });
    var maiorContSC = contagemSC.entries.reduce((a, b) => a.value > b.value ? a : b);

    //SP
    Map<double, int> contagemSP = ventoAnoSP.fold({}, (mapa, temp) {
      mapa[temp] = (mapa[temp] ?? 0) + 1;
      return mapa;
    });
    var maiorContSP = contagemSP.entries.reduce((a, b) => a.value > b.value ? a : b);

    printt('''
Relatório Anual

Santa Catarina

Direção do vento com maior frequência: ${yellow("${maiorContSC.key.toStringAsFixed(2)}°, ${grausRadianos(maiorContSC.key).toStringAsFixed(2)} rad")}

São Paulo

Direção do vento com maior frequência: ${yellow("${maiorContSP.key.toStringAsFixed(2)}°, ${grausRadianos(maiorContSP.key).toStringAsFixed(2)} rad")}
    ''');
  }
}