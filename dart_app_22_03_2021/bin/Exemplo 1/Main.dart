import 'aluno.dart';

void main() {
  Aluno aluno1 = Aluno();
  Aluno aluno2 = Aluno();

  aluno1.nome = 'Jonas Sprocatti';
  aluno1.email = 'jass-1999@hotmail.com';
  aluno1.idade = 21;

  print('O aluno ${aluno1.nome} tem ${aluno1.idade} anos.');
  aluno1.fazAniversario();
  print('O aluno ${aluno1.nome} tem ${aluno1.idade} anos.');

  aluno2.nome = 'Xongão';
  aluno2.email = 'xongaum@outlook.com';
  aluno2.idade = 35;

  print('O aluno ${aluno2.nome} tem ${aluno2.idade} anos.');
  aluno2.fazAniversario();
  print('O aluno ${aluno2.nome} tem ${aluno2.idade} anos.');
}
