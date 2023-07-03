import 'package:cleanpotter/domain/entities/character_entity.dart';

class CharacterDTO {
  String? id;
  String? name;
  String? dateOfBirth;
  String? image;

  CharacterDTO({
    this.id,
    this.name,
    this.dateOfBirth,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'image': image,
    };
  }

  factory CharacterDTO.fromMap(Map<String, dynamic> map) {
    return CharacterDTO(
      id: map['id'],
      name: map['name'] ?? 'no-name',
      dateOfBirth: map['dateOfBirth'] ?? 'no-date-birth',
      image: map['image'] ?? 'no-image',
    );
  }

  factory CharacterDTO.fromEntity(CharacterEntity entity) => CharacterDTO(
        id: entity.id,
        name: entity.name,
        dateOfBirth: entity.dateOfBirth,
        image: entity.photo,
      );

  CharacterEntity toEntity() => CharacterEntity(
        id: id,
        name: name ?? 'no-name',
        dateOfBirth: dateOfBirth ?? 'no-date-birth',
        photo: image ?? 'no-image',
      );
}
