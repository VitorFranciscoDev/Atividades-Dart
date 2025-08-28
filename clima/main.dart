import 'dart:io';
import 'util/temperatura.dart';
import 'util/umidade.dart';
import 'util/vento.dart';

void main() async {
  while(true) {
    print('''
Olá, Leandro. Que relatório você precisa?
    1 - Temperatura
    2 - Umidade
    3 - Direção do Vento
        Digite o número da opção desejada:
    ''');

    String? opcao = stdin.readLineSync(); //Lê a opção digitada pelo usuário
    int op = int.tryParse(opcao!) ?? 0; //Transforma em int

    try {
        switch(op) {
            case 1:
                Temperatura temp = Temperatura();
                await temp.relatorio();
                break;
            case 2:
                Umidade umidade = Umidade();
                await umidade.relatorio();
                break;
            case 3:
                DirecaoVento vento = DirecaoVento();
                await vento.relatorio();
                break;
            default:
                print("Opção inválida");
        }
    } catch(e) {
        print("Ocorreu um erro: $e");
    }
  }
}