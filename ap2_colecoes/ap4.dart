void main() {
  //declaração do map
  Map<String, List<String>> estados = {
    'SC' : ['Gaspar', 'Blumenau', 'Florianopolis'],
    'PR' : ['Curitiba', 'Cascavel', 'Foz do Iguaçu'],
    'SP' : ['Sao Paulo', 'Guarulhos', 'Campinas'],
    'MG' : ['Belo Horizonte', 'Juiz de Fora'],
  };

  //printa as chaves do map
  print('Estados: ${estados.keys.join(' ; ')}');

  //adiciona os valores de 'SC' a uma lista e organiza em ordem alfabética
  final sc = estados['SC']!;
  sc.sort();

  //printa cidades de SC
  print('Cidades de SC: ${sc.join(' ; ')}');

  //declaração da lista / for para adicionar as cidades e respectivos estados em todasCidades
  List<String> todasCidades = [];
  estados.forEach((estado, cidades) {
    for(String cidade in cidades) {
        todasCidades.add('$cidade - $estado');
    }
  });

  //organiza todasCidades em ordem alfabética e printa as cidades e seus respectivos estados
  todasCidades.sort();
  for(String cidadeEstado in todasCidades) {
    print(cidadeEstado);
  }
  
}