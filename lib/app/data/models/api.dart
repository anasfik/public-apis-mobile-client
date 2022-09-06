class Api {
  Api({
    required this.name,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
  });

  String name, description, link, cors, auth, https;

  factory Api.fromJson(Map<String, String> apiInJson) {
    return Api(
      name: apiInJson["name"] ?? "null name value",
      auth: apiInJson['auth'] ?? "null auth value",
      cors: apiInJson['Cors'] ?? "null cors value",
      description: apiInJson['Description'] ?? "null description value",
      https: apiInJson['https'] ?? "null https value",
      link: apiInJson['link'] ?? "null link value",
    );
  }

  Map<String, String> toJson() {
    return {
      "name": name,
      "description": description,
      "link": link,
      "cors": cors,
      "auth": auth,
      "https": https,
    };
  }
}
