class Pessoa {
  String _nome;
  String _sobrenome;
  String _sexo;
  String _email;
  int _idade;
  String _endereco;
  double _altura;
  double _peso;
  String _profissao;
  String _nacionalidade;

  //Construtor
  Pessoa(
      {String nome,
      String sobrenome,
      String sexo,
      String email,
      int idade,
      String endereco,
      double altura,
      double peso,
      String profissao,
      String nacionalidade}) {
    _nome = nome;
    _sobrenome = sobrenome;
    _sexo = sexo;
    _email = email;
    _idade = idade;
    _endereco = endereco;
    _altura = altura;
    _peso = peso;
    _profissao = profissao;
    _nacionalidade = nacionalidade;
  }

  String get nome => _nome; //Método Get para o Nome
  void setNome(String nome) {
    // Método Set para o Nome
    _nome = nome;
  }

  String get sobrenome => _sobrenome; //Método Get para o Sobrenome
  void setSobrenome(String sobrenome) {
    // Método Set para o Sobrenome
    _sobrenome = sobrenome;
  }

  String get sexo => _sexo; //Método Get para o sexo
  void setSexo(String sexo) {
    // Método Set para o sexo
    _sexo = sexo;
  }

  String get email => _email; //Método Get para o email
  void setEmail(String email) {
    // Método Set para o email
    _email = email;
  }

  int get idade => _idade; //Método Get para a idade
  void setIdade(int idade) {
    // Método Set para a idade
    _idade = idade;
  }

  String get endereco => _endereco; //Método Get para o endereço
  void setEndereco(String endereco) {
    // Método Set para o endereço
    _endereco = endereco;
  }

  double get altura => _altura; //Método Get para a altura
  void setAltura(double altura) {
    // Método Set para a Altura
    _altura = altura;
  }

  double get peso => _peso; //Método Get para o peso
  void setPeso(double peso) {
    // Método Set para o peso
    _peso = peso;
  }

  String get profissao => _profissao; //Método Get para a profissao
  void setProfissao(String profissao) {
    // Método Set para a profissao
    _profissao = profissao;
  }

  String get nacionalidade => _nacionalidade; //Método Get para a nacionalidade
  void setNacionalidade(String nacionalidade) {
    // Método Set para a nacionalidade
    _nacionalidade = nacionalidade;
  }
}
