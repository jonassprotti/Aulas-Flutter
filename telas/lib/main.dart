import 'package:flutter/material.dart';

import 'dados.dart';

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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  // Verifica se o login foi realizado com sucesso
  // Lógica da transferência de dados (Enviar para outra tela)
  void _enviarDadosOutraTela(BuildContext context) {
    List conteudo = <String>[usuarioController.text, senhaController.text];
    // Enviando os dados
    Navigator.push(
      context,
      MaterialPageRoute(
        //Chama a página (tela) de destino
        builder: (context) => Dados(conteudo: conteudo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegação entre Telas'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Campo usuário
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: usuarioController,
                  decoration: InputDecoration(labelText: "Usuário"),
                ),
              ),

              // Campo senha
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: senhaController,
                  decoration: InputDecoration(labelText: "Senha"),
                ),
              ),

              // Login
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 50.0,
                  child: RawMaterialButton(
                    onPressed: () {
                      _enviarDadosOutraTela(context);
                    },
                    child: Text('Login'),
                  ),
                ),
              ),

              // Botão para cadastrar
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 50.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastrar',
                    ),
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
