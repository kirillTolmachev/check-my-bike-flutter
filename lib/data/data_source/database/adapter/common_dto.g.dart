// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dto/common_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonDTOAdapter extends TypeAdapter<CommonDTO> {
  @override
  final int typeId = 1;

  @override
  CommonDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonDTO()
      ..isFirstStart = fields[0] == null ? true : fields[0] as bool?;
  }

  @override
  void write(BinaryWriter writer, CommonDTO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isFirstStart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
