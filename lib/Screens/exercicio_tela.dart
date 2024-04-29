import "package:flutter/material.dart";
import "package:flutter_gymapp/Models/exercicio_model.dart";
import "package:flutter_gymapp/Models/sentimento_model.dart";
import "package:flutter_gymapp/_comum/cores.dart";

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final Exercicio exercicioModelo = Exercicio(
      "ex01", "Remada baixa supinada", "Treino A", "Segura a barra e puxa");

  final List<SentimentoModel> listaSentimentos = [
    SentimentoModel("SE001", "pouca ativação hoje", "25/04/2024"),
    SentimentoModel("SE002", "senti ativação hoje", "27/04/2024"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
            title: Column(
              children: [
                Text(exercicioModelo.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white)),
                Text(
                  exercicioModelo.treino,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                )
              ],
            ),
            backgroundColor: Cores.azulEscuro,
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 72,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.vertical(
                    bottom: Radius.circular(32)))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("button add was pressed");
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Enviar foto"),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Remover Foto"))
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Como fazer?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(exercicioModelo.comoFazer),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(color: Colors.black),
              ),
              const Text(
                "Como estou me sentindo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(listaSentimentos.length, (index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(listaSentimentos[index].sentindo),
                    subtitle: Text(listaSentimentos[index].data),
                    leading: const Icon(Icons.double_arrow),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {},
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
