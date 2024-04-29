import 'package:flutter/material.dart';
import 'package:flutter_gymapp/Screens/autenticacao_tela.dart';
import 'package:flutter_gymapp/Screens/exercicio_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AutenticacaoTela());
  }
}
