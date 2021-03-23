class Aluno {
  String _nome;
  String _email;
  int _idade;

  //Construtor
  Aluno({String nome, String email, int idade}) {
    _nome = nome;
    _email = email;
    _idade = idade;
  }

  // Getters e Setters

  String get nome => _nome; //Método Get para o Nome
  void setNome(String nome) {
    // Método Set para o Nome
    _nome = nome;
  }
}
