import 'package:hive/hive.dart';

import 'AllApis.dart';

part 'favoriteApi.g.dart';

@HiveType(typeId: 100)
class FavoriteApi {
  factory FavoriteApi.from(Api api, String category) {
    return FavoriteApi(
      category: category,
      name: api.name,
      link: api.link,
      auth: api.auth,
      description: api.description,
      cors: api.cors,
      https: api.https,
    );
  }
  FavoriteApi({
    required this.name,
    required this.category,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
  });
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  String auth;
  @HiveField(4)
  String https;
  @HiveField(5)
  String cors;
  @HiveField(6)
  String link;
  @HiveField(7)
  String category;
}
