import 'dart:math';

class Operacoes {
  ///Soma os 2 valores recebidos
  dynamic soma(var valor1, var valor2) {
    return valor1 + valor2;
  }

  ///Multiplica os valores
  dynamic multiplicacao(var valor1, var valor2) {
    return valor1 * valor2;
  }

  ///Necessário o darth:math para funcionar

  dynamic potencia(var base, int expoente) {
    return pow(base, expoente);
  }

  ///Somente números inteiros podem ser classificados como par ou ímpar
  ///
  ///parâmetro: valor inteiro -> ex. isPar(43)
  ///
  ///Retorno Boolean: True ou False

  bool isPar(int valor) {
    if (valor % 2 == 0) {
      return true;
    } else {
      return false;
    }
  }
}
