import 'dart:convert';

GetNewsByCategoryResponse getNewsByCategoryResponseFromJson(String str) => GetNewsByCategoryResponse.fromJson(json.decode(str));

String getNewsByCategoryResponseToJson(GetNewsByCategoryResponse data) => json.encode(data.toJson());

class GetNewsByCategoryResponse {
    final String status;
    final int totalResults;
    final List<NewsApiEntity> articles;

    GetNewsByCategoryResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory GetNewsByCategoryResponse.fromJson(Map<String, dynamic> json) => GetNewsByCategoryResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<NewsApiEntity>.from(json["articles"].map((x) => NewsApiEntity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class NewsApiEntity {
    final NewsApiEntitySource source;
    final String? author;
    final String title;
    final String description;
    final String url;
    final String urlToImage;
    final DateTime publishedAt;
    final String content;

    NewsApiEntity({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory NewsApiEntity.fromJson(Map<String, dynamic> json) => NewsApiEntity(
        source: NewsApiEntitySource.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"] ?? 'no-description',
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'no-image',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'no-content',
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class NewsApiEntitySource {
    final String? id;
    final String name;

    NewsApiEntitySource({
        required this.id,
        required this.name,
    });

    factory NewsApiEntitySource.fromJson(Map<String, dynamic> json) => NewsApiEntitySource(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
