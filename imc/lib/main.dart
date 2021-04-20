import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(230, 230, 230, 1)),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Vamos implementar nossos Widgets
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _resultado = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Criar um botão (Método) reset para limpar os dados
  void _reset() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _resultado = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaIMC() {
    setState(() {
      double peso = double.parse(pesoController.text.replaceAll(',', '.'));
      double altura = double.parse(alturaController.text.replaceAll(',', '.'));
      double imc = peso / (altura * altura);

      if (imc < 17) {
        _resultado = 'Você está muito abaixo do peso ideal!';
      } else if (imc < 18.5) {
        _resultado = 'Você está abaixo do peso ideal!';
      } else if (imc < 25) {
        _resultado = 'Parabéns! Você está em seu peso ideal!';
      } else if (imc < 30) {
        _resultado = 'Você está acima do seu peso ideal!';
      } else if (imc < 35) {
        _resultado = 'Obsidade Grau I';
      } else if (imc < 40) {
        _resultado = 'Obsidade Grau II';
      } else {
        _resultado = 'Obsidade Grau III';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Calculadora de IMC',
            style: TextStyle(color: Colors.yellow[800]),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _reset();
                }),
          ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            Icon(
              Icons.fitness_center_outlined,
              size: 150,
              color: Colors.yellow[800],
            ),
            TextFormField(
                controller: alturaController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Informe a altura' : null,
                decoration: InputDecoration(
                  labelText: 'Altura',
                  labelStyle: TextStyle(color: Colors.yellow[800]),
                ),
                style: TextStyle(color: Colors.yellow[800], fontSize: 26.0)),
            TextFormField(
                controller: pesoController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value.isEmpty ? 'Informe o peso' : null,
                decoration: InputDecoration(
                  labelText: 'Peso',
                  labelStyle: TextStyle(color: Colors.yellow[800]),
                ),
                style: TextStyle(color: Colors.yellow[800], fontSize: 26.0)),
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) _calculaIMC();
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                  color: Colors.yellow[800],
                ),
              ),
            ),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.yellow[800], fontSize: 30.0),
            )
          ]),
        ),
      ),
    );
  }
}
