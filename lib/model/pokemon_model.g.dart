// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelPokemonsAdapter extends TypeAdapter<ModelPokemons> {
  @override
  final int typeId = 0;

  @override
  ModelPokemons read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelPokemons(
      pokemon: (fields[0] as List?)?.cast<Pokemon>(),
    );
  }

  @override
  void write(BinaryWriter writer, ModelPokemons obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pokemon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelPokemonsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 1;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      id: fields[0] as int?,
      num: fields[1] as String?,
      name: fields[2] as String?,
      img: fields[3] as String?,
      type: (fields[4] as List?)?.cast<String>(),
      height: fields[5] as String?,
      weight: fields[6] as String?,
      candy: fields[7] as String?,
      candyCount: fields[8] as int?,
      egg: fields[9] as String?,
      spawnChance: fields[10] as double?,
      avgSpawns: fields[11] as double?,
      spawnTime: fields[12] as String?,
      multipliers: (fields[13] as List?)?.cast<double>(),
      weaknesses: (fields[14] as List?)?.cast<String>(),
      nextEvolution: (fields[15] as List?)?.cast<Evolution>(),
      prevEvolution: (fields[16] as List?)?.cast<Evolution>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.num)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.img)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.candy)
      ..writeByte(8)
      ..write(obj.candyCount)
      ..writeByte(9)
      ..write(obj.egg)
      ..writeByte(10)
      ..write(obj.spawnChance)
      ..writeByte(11)
      ..write(obj.avgSpawns)
      ..writeByte(12)
      ..write(obj.spawnTime)
      ..writeByte(13)
      ..write(obj.multipliers)
      ..writeByte(14)
      ..write(obj.weaknesses)
      ..writeByte(15)
      ..write(obj.nextEvolution)
      ..writeByte(16)
      ..write(obj.prevEvolution);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EvolutionAdapter extends TypeAdapter<Evolution> {
  @override
  final int typeId = 2;

  @override
  Evolution read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Evolution(
      num: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Evolution obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.num)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvolutionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
