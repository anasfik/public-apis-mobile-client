import 'dart:convert';

List<CategoryApis> categoriesApisFromJson(String str) =>
    List<CategoryApis>.from(
      json.decode(str).map(
            (x) => CategoryApis.fromJson(x),
          ),
    );

String categoriesApisToJson(List<CategoryApis> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class CategoryApis {
  String title;
  List<Api> apis;
  CategoryApis({
    required this.title,
    required this.apis,
  });

  factory CategoryApis.fromJson(Map<String, dynamic> json) => CategoryApis(
        title: json["title"],
        apis: List<Api>.from(json["apis"].map((x) => Api.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "apis": List<dynamic>.from(apis.map((x) => x.toJson())),
      };
}

class Api {
  String name;
  String description;
  String auth;
  String https;
  String cors;
  String link;

  Api({
    required this.name,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
  });

  factory Api.fromJson(Map<String, dynamic> json) => Api(
        name: json["name"],
        description: json["description"],
        auth: json["auth"],
        https: json["https"],
        cors: json["cors"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "auth": auth,
        "https": https,
        "cors": cors,
        "link": link,
      };
}
