import 'Operacoes.dart';

void main() {
  Operacoes op = Operacoes();
  var v1 = 2;
  var v2 = 3;

  print('Somar $v1 com $v2 é igual à ${op.soma(v1, v2)}');

  print('Multiplicar $v1 com $v2 é igual à ${op.multiplicacao(v1, v2)}');

  print('Usando a base $v1 com potência $v2 é igual à ${op.potencia(v1, v2)}');

  print(op.isPar(v2));
}
