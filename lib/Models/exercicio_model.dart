class Exercicio {
  String id;
  String name;
  String treino;
  String comoFazer;

  String? urlImagem;

  Exercicio(this.id, this.name, this.treino, this.comoFazer);

  Exercicio.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        treino = map["treino"],
        comoFazer = map["comoFazer"],
        urlImagem = map["urlImagem"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": treino,
      "comoFazer": comoFazer,
      "urlImagem": urlImagem,
    };
  }
}
