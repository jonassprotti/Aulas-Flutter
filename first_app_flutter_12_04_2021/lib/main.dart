import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Tudo que está no Stateless é imutável enquanto permanecer na tela!
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Primeiro App Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _r = 255;
  int _g = 255;
  int _b = 255;
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_r > 0) {
        _r--;
      } else if (_g > 0) {
        _g--;
      } else if (_b > 0) {
        _b--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(_r, _g, _b, 1.0),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Você apertou o botão essa quantidade de vezes:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementando',
        child: Icon(Icons.add_circle_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
