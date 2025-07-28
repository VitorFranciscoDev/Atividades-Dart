// Tempo cronometrado: 7:22
// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

// -------------------------------------------------------------
// ADICIONAR IMPLEMENTACAO RESTANTE ABAIXO DESSA LINHA
// -------------------------------------------------------------

//Interface que possui o método fazerLigacao
abstract class MeioDeComunicacao {
  void fazerLigacao(String numero);
}

//Classes que implementam interface e seu método fazerLigacao

class Telefone implements MeioDeComunicacao {
  void fazerLigacao(String numero) {
    print("[TELEFONE] Ligando para (47) 99876-5432...");
  }
}

class Celular implements MeioDeComunicacao {
  void fazerLigacao(String numero) {
    print("[CELULAR] Ligando para (47) 99876-5432...");
  }
}

class Orelhao implements MeioDeComunicacao {
  void fazerLigacao(String numero) {
    print("[ORELHÃO] Ligando para (47) 99876-5432...");
  }
}