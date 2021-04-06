//Uma lista é uma estrutura de dados que armazena dados na memória de forma
//sequencial, ou seja, um valor depois do outro.
//Também podemos associar uma lista a um vetor (Estrutura de dados básica)

void main(List<String> arguments) {
  // var compras = <String>[
  //   'Cenoura',
  //   'Banana',
  //   'Brócolis',
  //   'Refrigerante',
  //   'Farinha de rosca'
  // ];

  //Manipulando a lista
  //imprimir (mostrar)
  //print(compras[0]);
  //print(compras[3]);

  //imprimir a lista toda
  //compras.add('Suco de caixinha');
  //print(compras);

  //Qual o tamanho da minha lista
  //print('Tamanho da lista ${compras.length}');

  //Pesquisando na lista
  //print(compras.contains('Banana'));

  //Fatiando uma sequência de caracteres por espaço
  //espaço - Split(pattern)
  //print('Jonas Antonio da Silva Sprocati'.split(' '));

  //Treinando
  //a - adicionar na lista de compras
  //print('Tamanho antes das adições ${compras.length}');
  //1 - Arroz
  //compras.add('Arroz');
  //2 - Abacaxi
  //compras.add('Abacaxi');
  //3 - Cebolas
  //compras.add('Cebola');
  //4 - Doritos
  //compras.add('Doritos');
  //Mostrar o tamanho da lista e verificar
  //print(compras);
  //print('Tamanho da lista ${compras.length}');
  //Saída: Tem mostarda ou não tem mostarda
  //if (compras.contains('Mostarda')) {
  //  print('Tem mostarda');
  //} else {
  //  print('Não tem mostarda');
  //}

  //Ordenação de listas: crescente ou decrescente
  //Ordem crescente
  //var ordenada = compras..sort();
  //print(ordenada);

  //Ordem decrescente
  //var decrescente = ordenada.reversed;
  //print(decrescente);

  //iterar na lista
  //for (var produto in compras) {
  //  print(produto);
  //}
  //treinando
  //Percorrer a lista usando:
  // - for e while
  //var x = 0;
  //while (x < compras.length) {
  //  print('${x + 1} - ${compras[x]}');
  //  x++;
  //}
  //
  //
  //

  //Criar uma lista de objetos

  var alunos = List.filled(0, Aluno(), growable: true);
  alunos.add(Aluno(ra: 123, nome: 'Jonas Sprocatti'));
  print(alunos.length);
}

class Aluno {
  int ra;
  String nome;

  //Construtor
  Aluno({this.ra, this.nome});
}
