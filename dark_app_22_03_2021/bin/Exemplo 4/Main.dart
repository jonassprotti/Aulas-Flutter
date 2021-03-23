import 'Pessoa.dart';

void main() {
  var pessoa = Pessoa(
      nome: 'Jonas Antonio',
      sobrenome: 'Da Silva Sprocatti',
      sexo: 'Masculino',
      email: 'jass-1999@hotmail.com',
      idade: 21,
      endereco: 'Rua Tabuleiros, 313',
      altura: 1.73,
      peso: 90,
      profissao: 'Fullstack Developer',
      nacionalidade: 'Brasileiro');

  //Setter
  //aluno.setNome('Jonas Sprocatti');

  //Getter
  print(pessoa.nome);
  print(pessoa.sobrenome);
  print(pessoa.sexo);
  print(pessoa.email);
  print(pessoa.idade);
  print(pessoa.endereco);
  print(pessoa.altura);
  print(pessoa.peso);
  print(pessoa.profissao);
  print(pessoa.nacionalidade);
}
