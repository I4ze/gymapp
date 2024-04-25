import "package:flutter/material.dart";
import "package:flutter_gymapp/Models/exercicio_model.dart";

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final Exercicio exercicioModelo = Exercicio(
    "ex01",
    "Remada baixa supinada",
    "Treino A",
    "Segura a barra e puxa"
  );

  final List<SentimentoModel> listaSentimentos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Puxada alta pronada - Treino A"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Enviar foto"),
              ),
              const Text(
                "Como fazer?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                  "Segura com as duas mão na barra, mantém a coluna reta e puxa"),
              const Divider(),
              const Text(
                "Como estou me sentindo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text("Senti bastante ativação hoje!")
            ],
          ),
        ));
  }
}
