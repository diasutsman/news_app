class Article {
  String author;
  String title;
  String content;
  String urlToImage;
  String publishedAt;

  // constructor untuk class article
  Article(
      {required this.title,
      required this.author,
      required this.urlToImage,
      required this.content,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"] ?? "Data tidak ditemukan",
        author: json["author"] ?? "Data tidak ditemukan",
        urlToImage: json["urlToImage"] ?? "https://btklsby.go.id/images/placeholder/basic.png",
        content: json["content"] ?? "Data tidak ditemukan",
        publishedAt: json["publishedAt"] ?? "Data tidak ditemukan",
      );
}
