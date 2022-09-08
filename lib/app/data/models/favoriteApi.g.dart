// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoriteApi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteApiAdapter extends TypeAdapter<FavoriteApi> {
  @override
  final int typeId = 100;

  @override
  FavoriteApi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteApi(
      name: fields[1] as String,
      category: fields[7] as String,
      description: fields[2] as String,
      auth: fields[3] as String,
      https: fields[4] as String,
      cors: fields[5] as String,
      link: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteApi obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.auth)
      ..writeByte(4)
      ..write(obj.https)
      ..writeByte(5)
      ..write(obj.cors)
      ..writeByte(6)
      ..write(obj.link)
      ..writeByte(7)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteApiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
