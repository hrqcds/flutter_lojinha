class Movel {
  String? titulo;
  String? foto;
  String? descricao;
  int? preco;

  Movel({this.titulo, this.foto, this.descricao, this.preco});

  Movel.fromJson(Map<String, dynamic> json) {
    titulo = json["titulo"];
    foto = json["foto"];
    descricao = json["descricao"];
    preco = json["preco"];
  }
}
