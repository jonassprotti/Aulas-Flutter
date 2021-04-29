import 'package:flutter/material.dart';

// Método principal da aplicação
void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Criação do ambiente do formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers da aplicação
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  //  Variáveis do ambiente que receberão os dados da API
  String _id = '';
  String _nome = '';
  String _email = '';
  String _erro = '';

  //  Documentação da API
  // https://github.com/EdsonMSouza/simple-php-api

  // Endereço da API
  // Uri url = Uri.parse('http://emsapi.esy.es/rest/api/search/');

  // Método para requisição da API
  jsonRestApiHttp() async {}

  // Corpo da aplicação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Configuração da barra do aplicativo
      appBar: AppBar(
        title: Text(
          'Webservices (API)',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.lightBlue[900],
                ),
              ),

              // Campo usuário
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: usuarioController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      value.isEmpty ? 'Informe o usuário' : null,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.email), // coloca um ícone dentro do campo
                    hintText: 'informe seu usuário',
                  ),
                  style:
                      TextStyle(color: Colors.lightBlue[900], fontSize: 16.0),
                ),
              ),

              // Campo senha
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  obscureText: true, // configura para ser invisível
                  controller: senhaController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) =>
                      value.isEmpty ? 'Informe a senha' : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'informe sua senha',
                  ),
                  style:
                      TextStyle(color: Colors.lightBlue[900], fontSize: 16.0),
                ),
              ),

              // Botão
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 50.0,
                  child: RawMaterialButton(
                    shape: RoundedRectangleBorder(
                        // arredondar o botão
                        borderRadius: BorderRadius.circular(
                            30.0)), // Deixa o botão arredondado
                    onPressed: () {
                      // requisição da API (método)
                      if (_formKey.currentState.validate()) jsonRestApiHttp();
                    },
                    child: Text(
                      'Acessar a API',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    fillColor: Colors.lightBlue[900],
                  ),
                ),
              ),

              // Mensagem de erro
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  child: Text(
                    _erro,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 20.0),
                  ),
                ),
              ),

              // ############# Mostra os valores retornados ###################
              // id
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Text(
                    _id,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.lightBlue[900], fontSize: 14.0),
                  ),
                ),
              ),

              //  Nome
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Container(
                  child: Text(
                    _nome,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.lightBlue[900], fontSize: 14.0),
                  ),
                ),
              ),

              // Email
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Container(
                  child: Text(
                    _email,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.lightBlue[900], fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
