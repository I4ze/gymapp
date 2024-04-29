import 'package:flutter/material.dart';
import 'package:flutter_gymapp/Componentes/design_campo_autenticacao.dart';
import 'package:flutter_gymapp/_comum/cores.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Cores.azulTopoGradiente, Cores.azulBaixoGradiente],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          "assets/logoAndroid.png",
                          height: 128,
                        ),
                        const Text(
                          "GymApp",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          decoration: getInputDesign("E-mail"),
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          decoration: getInputDesign("Senha"),
                          obscureText: true,
                        ),
                        const SizedBox(height: 8.0),
                        Visibility(
                          visible: !queroEntrar,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: getInputDesign("Confirme a senha"),
                                obscureText: true,
                              ),
                              const SizedBox(height: 8.0),
                              TextFormField(
                                decoration: getInputDesign("Nome"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text((queroEntrar) ? "Entrar" : "Cadastrar"),
                        ),
                        const Divider(),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              queroEntrar = !queroEntrar;
                            });
                          },
                          child: Text(
                              (queroEntrar) ? "Cadastre-se" : "Fazer login"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
