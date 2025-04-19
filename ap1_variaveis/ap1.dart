void main() {
String nome = "Vitor";
String sobrenome = "Francisco";
int idade = 18;
bool ativo = true;
double peso = 67.75;
String nacionalidade = "Brasileiro";

//printa nome da pessoa
print("Nome completo: $nome $sobrenome");

//se idade for menor que 18: printa idade e menor de idade. se for maior que 18: printa idade e maior de idade.
if(idade<18){
print("Idade: $idade (menor de idade)");
} else {
print("Idade: $idade (maior de idade)");
}

//se ativo é true, printa Situação: Ativo. se ativo é false printa Situação: Inativo.
if(ativo==true) {
  print("Situação: Ativo");
} else {
  print("Situação: Inativo");
}

//printa peso da pessoa
print("Peso: $peso");

//se nacionalidade for diferente de null, printa a nacionalidade da pessoa. se não for, printa não informada
if(nacionalidade!=null) {
print("Nacionalidade: $nacionalidade");
} else {
  print("Nacionalidade: Não informada");
}

}