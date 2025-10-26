// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsResponseAdapter extends TypeAdapter<NewsResponse> {
  @override
  final int typeId = 0;

  @override
  NewsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResponse(
      totalResults: fields[0] as int,
      articles: (fields[1] as List).cast<Article>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.totalResults)
      ..writeByte(1)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
