import 'package:flutter/material.dart';
import 'package:flutter_gymapp/Componentes/design_campo_autenticacao.dart';
import 'package:flutter_gymapp/_comum/cores.dart';
import 'package:flutter_gymapp/_comum/snack_bar.dart';
import 'package:flutter_gymapp/services/auth_service.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AutenticacaoServico _authServico = AutenticacaoServico();

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
                key: _formKey,
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
                          controller: _emailController,
                          decoration: getInputDesign("E-mail"),
                          validator: (String? value) {
                            if (value == null) {
                              return "Nome não pode ser vazio";
                            }
                            if (!value.contains("@")) {
                              return "Formato de email inválido";
                            }
                            if (value.length < 5) {
                              return "E-mail muito curto";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _senhaController,
                          decoration: getInputDesign("Senha"),
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null) {
                              return "Senha não pode ser vazia";
                            }
                            if (value.length < 5) {
                              return "senha muito curta";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Visibility(
                          visible: !queroEntrar,
                          child: Column(
                            children: [
                              const SizedBox(height: 8.0),
                              TextFormField(
                                controller: _nomeController,
                                decoration: getInputDesign("Nome"),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "Nome não pode ser vazio";
                                  }
                                  if (value.length < 5) {
                                    return "nome muito curto";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: botaoPrincipalClicado,
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

  botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        _authServico
            .logarUsuarios(
          email: email,
          senha: senha,
        )
            .then((String? error) {
          if (error != null) {
            mostraSnackBar(context: context, texto: error);
          }
        });
      } else {
        _authServico
            .cadastrarUsuario(
          nome: nome,
          email: email,
          senha: senha,
        )
            .then((String? error) {
          if (error != null) {
            mostraSnackBar(context: context, texto: error);
          }
        });
      }
    } else {
      print("form invalido");
    }
  }
}
