// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dto/language_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageDTOAdapter extends TypeAdapter<LanguageDTO> {
  @override
  final int typeId = 5;

  @override
  LanguageDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageDTO()
      ..iconPath = fields[0] as String?
      ..name = fields[1] == null ? 'eng' : fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, LanguageDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iconPath)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
