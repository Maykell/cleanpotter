import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterEntity', () {
    test('Should calculate correctly age', () {
      final character = CharacterEntity(
        name: 'Harry Potter',
        dateOfBirth: '1988-06-29',
        photo: 'any_url',
      );

      final age = character.ageInYears();

      expect(age, 35);
    });

    test('Should throw a FormatException when date is invalid', () {
      const String invalidDate = '31-07-1980';

      final character = CharacterEntity(
        name: 'Harry Potter',
        dateOfBirth: invalidDate,
        photo: 'any_url',
      );

      expect(character.ageInYears, throwsFormatException);
    });
  });
}
