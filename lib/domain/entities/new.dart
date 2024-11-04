class New {
  final String title;
  final String description;
  final String content;
  final String image;
  final String linkToNew;
  final String source;
  final String author;

  New({
    required this.title, 
    required this.description, 
    this.content = 'Revisa todo el contenido en el enlace de la noticia',
    required this.image,
    required this.linkToNew,
    required this.source,
    this.author = 'Desconocido'
  });
}