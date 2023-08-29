import 'package:cleanpotter/domain/entities/character_entity.dart';

class CharacterDTO {
  String? id;
  String? name;
  String? dateOfBirth;
  int? yearOfBirth;
  String? image;

  CharacterDTO({
    this.id,
    this.name,
    this.dateOfBirth,
    this.yearOfBirth,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'yearOfBirth': yearOfBirth,
      'image': image,
    };
  }

  factory CharacterDTO.fromMap(Map<String, dynamic> map) {
    return CharacterDTO(
      id: map['id'],
      name: map['name'] ?? 'no-name',
      dateOfBirth: map['dateOfBirth'] ?? 'no-date-birth',
      yearOfBirth: map['yearOfBirth'] ?? 1969,
      image: map['image'] ?? 'no-image',
    );
  }

  factory CharacterDTO.fromEntity(CharacterEntity entity) => CharacterDTO(
        id: entity.id,
        name: entity.name,
        dateOfBirth: entity.dateOfBirth,
        yearOfBirth: entity.yearOfBirth,
        image: entity.photo,
      );

  CharacterEntity toEntity() => CharacterEntity(
        id: id,
        name: name ?? 'no-name',
        dateOfBirth: dateOfBirth ?? 'no-date-birth',
        yearOfBirth: yearOfBirth ?? 1969,
        photo: image ?? 'no-image',
      );
}
