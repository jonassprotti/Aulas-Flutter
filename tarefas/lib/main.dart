import 'package:flutter/material.dart';
import 'package:tarefas/tema/tema.dart';
import 'package:tarefas/telas/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Tarefas',
      themeMode: ThemeMode.system, //Define o tema automaticamente
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: Home(),
    ),
  );
}
