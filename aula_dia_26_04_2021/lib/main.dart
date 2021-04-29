import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Método principal da aplicação
void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

//Criando uma classe
class Pessoa {
  String id;
  String status;
  String nome;
  String email;

  Pessoa({this.id, this.status, this.nome, this.email});

  //Design Pattern (Factory)
  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      id: json['id'] as String,
      status: json['status'] as String,
      nome: json['name'] as String,
      email: json['email'] as String,
    );
  }
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
  Uri url = Uri.parse('http://emsapi.esy.es/rest/api/search/');

  // Método para requisição da API
  jsonRestApiHttp() async {
    http.Response response = await http.post(
      this.url,
      headers: <String, String>{
        "Content-Type": "Application/json; charset=UTF-8",
        "Authorization": "123"
      },
      body: jsonEncode(<String, String>{
        "username": usuarioController.text,
        "password": senhaController.text,
      }),
    );

    //Parser do json
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    List pessoa = parsed.map<Pessoa>((json) => Pessoa.fromJson(json)).toList();

    //Percorrer os resultados
    for (var p in pessoa) {
      //Ocorreu erro na resposta com os dados
      if (p.status != "201") {
        //Dados validos na resposta
        usuarioController.text = "";
        senhaController.text = "";
        setState(() {
          _id = "";
          _nome = "";
          _email = "";
          _erro = "Dados não localizados!";
        });
      } else {
        //Sucesso com os dados
        setState(() {
          _id = p.id;
          _nome = p.nome;
          _email = p.email;
          _erro = "";
        });
      }
    }
  }

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
