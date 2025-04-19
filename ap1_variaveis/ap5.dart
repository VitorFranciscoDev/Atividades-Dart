void main() {
const pessoa = Pessoa("Vitor", "Francisco", 17, true, 67.75, "Brasileiro");
print(pessoa.toString());
} 

//construtor da classe pessoa
class Pessoa {
  const Pessoa(
    this.nome,
    this.sobrenome,
    this.idade,
    this.ativo,
    this.peso,
    this.nacionalidade,
  );

  //declaração das variáveis
  final String nome;
  final String sobrenome;
  final int idade;
  final bool ativo;
  final double peso;
  final String? nacionalidade;

  String toString() {
    var imprimir = "";

    //imprime o nome
    imprimir += "Nome completo: $nome $sobrenome\n";
    
    //se idade for menor que 18, imprime idade e menor de idade. se for maior que 18, imprime idade e maior de idade
    if(idade<18) {
      imprimir += "Idade: $idade (menor de idade)\n";
    } else {
      imprimir += "Idade: $idade (maior de idade)\n";
    }

    //se ativo for verdadeiro, printa Situação: Ativo. se for falso, printa Situação: Inativo
    if(ativo==true) {
      imprimir += "Situação: Ativo\n";
    } else {
      imprimir += "Situação: Inativo\n";
    }

    //imprime o peso
    imprimir += "Peso: $peso\n";

    //se nacionalidade for diferente de null, printa a nacionalidade da pessoa. se for null printa não informada
    if(nacionalidade!=null) {
      imprimir += "Nacionalidade: $nacionalidade\n";
    } else {
      imprimir += "Nacionalidade: Não informada\n";
    }
    
    return imprimir;

  }
}