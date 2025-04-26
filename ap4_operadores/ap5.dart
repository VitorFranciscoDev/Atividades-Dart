void main() {
  //Declaração do map
  Map<String, int?> pessoas = {
    "Nelson" : null,
    "Jane" : null,
    "Jack" : 16,
    "Rupert" : 37,
    "Andy" : 13,
    "Kim" : 27,
    "Robert" : 31,
  };

  //forEach para printar as idades(caso seja null, printa idade nao informada)
  pessoas.forEach((nome, idade) {
    print("$nome - ${idade?.toString() ?? "idade nao informada"}");
  });
}