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

class Umidade {
  //Lista com arquivos
  List<String> sc = List.generate(12, (i) => "sensores/SC_2024_${i+1}.csv");
  List<String> sp = List.generate(12, (i) => "sensores/SP_2024_${i+1}.csv");

  //Lista de temperaturas do ano
  List<double> umidadeAnoSC = [];
  List<double> umidadeAnoSP = [];

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

        List<double> umidadeMesSC = []; //Lista do mês de SC
        for(var linhaSC in linhasSC) {
          final partesSC = linhaSC.split(","); //Armazena as partes da linha em um List
          if(partesSC.length==8) {
            final umidadeSC = double.parse(partesSC[4]); //Armazena a umidade

            //Adiciona as umidades de SC nas Lists
            umidadeMesSC.add(umidadeSC);
            umidadeAnoSC.add(umidadeSC);
          }
        }

        //São Paulo
        final bytesSP = await fileSP.readAsBytes(); //Transforma em bytes
        final conteudoSP = latin1.decode(bytesSP); //Converte os bytes
        final linhasSP = const LineSplitter().convert(conteudoSP).skip(1); //Transforma em linhas e pula a primeira(cabeçário)

        List<double> umidadeMesSP = []; //Lista do mês de SP
        for(var linhaSP in linhasSP) {
          final partesSP = linhaSP.split(","); //Armazena as partes da linha em um List
          if(partesSP.length==8) {
            final umidadeSP = double.parse(partesSP[4]); //Armazena a umidade

            //Adiciona as umidades de SP nas Lists
            umidadeMesSP.add(umidadeSP);
            umidadeAnoSP.add(umidadeSP);
          }
        }
      
      //Faz as médias mensais de SC e SP
      final mediaMesSC = umidadeMesSC.reduce((a, b) => a + b) / umidadeMesSC.length;
      final mediaMesSP = umidadeMesSP.reduce((a, b) => a + b) / umidadeMesSP.length;

      //Coloca as Lists em ordem crescente
      umidadeMesSC.sort();
      umidadeMesSP.sort();
      
      //Chama a função para formatar a umidade e mostra-la em outras unidades
      formatarUmidadeMes(Meses.values[i], mediaMesSP, mediaMesSC, umidadeMesSC, umidadeMesSP);

      } else {
        print("Falha ao ler arquivo");
      }
    }

    //Faz as médias anuais de SC e SP
    final mediaAnoSC = umidadeAnoSC.reduce((a, b) => a + b) / umidadeAnoSC.length;
    final mediaAnoSP = umidadeAnoSP.reduce((a, b) => a + b) / umidadeAnoSP.length;

    //Coloca as Lists em ordem crescente
    umidadeAnoSC.sort();
    umidadeAnoSP.sort();

    formatarUmidadeAno(mediaAnoSP, mediaAnoSC, umidadeAnoSC, umidadeAnoSP);
    await salvarRelatorio("UMIDADE", _conteudo.toString());
  }

  final StringBuffer _conteudo = StringBuffer();

  void printt(String texto) {
    print(texto);
    _conteudo.writeln(texto); //Adiciona no Buffer
  }

  //Função para salvar os dados do relatório num .txt
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
  void formatarUmidadeMes(Meses mes, double mediaMesSP, double mediaMesSC, List<double> umidadeMesSC, List<double> umidadeMesSP) {
    printt('''
${mes.name[0].toUpperCase()}${mes.name.substring(1)}

Santa Catarina

${green("Média: ${mediaMesSC.toStringAsFixed(4)}")}
${red("Máxima: ${umidadeMesSC.last.toStringAsFixed(4)}")}
${blue("Mínima: ${umidadeMesSC.first.toStringAsFixed(4)}")}

São Paulo

${green("Média: ${mediaMesSP.toStringAsFixed(4)}")}
${red("Máxima: ${umidadeMesSP.last.toStringAsFixed(4)}")}
${blue("Mínima: ${umidadeMesSP.first.toStringAsFixed(4)}")}
    ''');
  }

  //Função para pegar as variáveis necessárias e printa-las(ano)
  void formatarUmidadeAno(double mediaAnoSP, double mediaAnoSC, List<double> umidadeAnoSC, List<double> umidadeAnoSP) {
    printt('''
Relatório Anual

Santa Catarina

${green("Média: ${mediaAnoSC.toStringAsFixed(4)}")}
${red("Máxima: ${umidadeAnoSC.last.toStringAsFixed(4)}")}
${blue("Mínima: ${umidadeAnoSC.first.toStringAsFixed(4)}")}

São Paulo

${green("Média: ${mediaAnoSP.toStringAsFixed(4)}")}
${red("Máxima: ${umidadeAnoSP.last.toStringAsFixed(4)}")}
${blue("Mínima: ${umidadeAnoSP.first.toStringAsFixed(4)}")}
    ''');
  }
}