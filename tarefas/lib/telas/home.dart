import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Criar uma lista para receber as tarefas
  List _toDoList = [];

//Controller para a lista
  final _toDoController = TextEditingController();

//Indice para controlar o ultimo elemento da lista removido
  int _indiceUltimoRemovido;

//Guarda o elemento removido (Temporário)
  Map<String, dynamic> _ultimoRemovido;
  //Todas vez que carregar o app vamos ver o estado inicial
  @override
  void _iniState() {
    super.initState();
    _lerDados().then((value) {
      setState(() {
        _toDoList = json.decode(value);
      });
    });
  }

  // Async - Determine que um método será assincrono, não retorna nada
  // imediatamente.

  // Await - determina que o aplicativo espere uma resposta de uma determinada
  // função.

  // Future - determina  que uma função vai retornar algo no "Futuro"
  // ou seja, levará um tempo para ser finalizada.

  Future<String> _lerDados() async {
    try {
      final arquivo = await _abreArquivo();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _abreArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/todolist.json");
  }

  Future<File> _salvarDados() async {
    String dados = json.encode(_toDoList); //Passa a lista de tarefas
    final arquivo = await _abreArquivo();
    return arquivo.writeAsString(dados);
  }

  Future<Null> _recarregaLista() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _toDoList.sort((a, b) {
        if (a['Realizado'] && !b['Realizado']) return 1;
        if (!a['Realizado'] && b['Realizado']) return -1;
        return 0;
      });
      _salvarDados();
    });
    return null;
  }

  void _adicionarTarefa() {
    setState(() {
      Map<String, dynamic> novaTarefa = Map();
      novaTarefa['Titulo'] = _toDoController.text;
      novaTarefa['Realizado'] = false; // -1
      _toDoController.text = '';
      _toDoList.add(novaTarefa);
      _salvarDados();
    });
  }

  //Vamos criar primeiramente a recuperação de uma tarefa apagada
  Widget widgetTarefa(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red, //Ficará vermelho quando arrastar para a esquerda
        child: Align(
          alignment: Alignment(0.85, 0.0),
          child: Icon(
            Icons.delete_sweep_outlined,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        title: Text(_toDoList[index]['Titulo']),
        value: _toDoList[index]['Realizado'],
        secondary: CircleAvatar(
          child: Icon(
            _toDoList[index]['Realizado'] ? Icons.check : Icons.error,
            color: Theme.of(context).iconTheme.color,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onChanged: (value) {
          setState(() {
            _toDoList[index]['Realizado'] = value;
            _salvarDados();
          });
        },
        checkColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).secondaryHeaderColor,
      ),
      onDismissed: (direction) {
        setState(() {
          //Coloca o registro no temporário
          _ultimoRemovido = Map.from(_toDoList[index]);
          _indiceUltimoRemovido = index;
          _toDoList.removeAt(index);
          _salvarDados();
        });

        final snack = SnackBar(
          content: Text("Tarefa \"${_ultimoRemovido['Titulo']}\" Apagada"),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                _toDoList.insert(_indiceUltimoRemovido, _ultimoRemovido);
                _salvarDados();
              });
            },
          ),
          duration: Duration(seconds: 4),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snack);
      }, //Desfazer
    );
  }

  //Construção da interface do usuário
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _toDoController,
                    maxLength: 50,
                    decoration: InputDecoration(labelText: "Nova Tarefa"),
                  ),
                ),
                Container(
                  height: 45.0,
                  width: 45.0,
                  child: FloatingActionButton(
                    child: Icon(Icons.save),
                    //Salvar o texto na lista
                    onPressed: () {
                      if (_toDoController.text.isEmpty) {
                        final alerta = SnackBar(
                          content: Text("Digite a nova Tarefa!"),
                          duration: Duration(seconds: 4),
                          action: SnackBarAction(
                            label: "Ok",
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(alerta);
                      } else {
                        _adicionarTarefa();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _recarregaLista,
              child: ListView.builder(
                itemBuilder: widgetTarefa,
                itemCount: _toDoList.length,
                padding: EdgeInsets.only(top: 10.0),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
