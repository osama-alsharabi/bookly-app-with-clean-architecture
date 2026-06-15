// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 1;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      image: fields[0] as String,
      title: fields[1] as String,
      author: fields[2] as String,
      price: fields[3] as num,
      rating: fields[4] as num,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
