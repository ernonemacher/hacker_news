class Information {
  String titulo = "";
  String subtitulo = "";
  int id;

  Information({this.titulo, this.subtitulo}) {
    this.id = DateTime.now().millisecondsSinceEpoch;
  }
}
