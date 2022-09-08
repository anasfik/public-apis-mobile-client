import 'package:hive/hive.dart';

part 'favoriteApi.g.dart';

@HiveType(typeId: 100)
class FavoriteApi {
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
