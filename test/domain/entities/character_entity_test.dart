import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterEntity', () {
    test('Should calculate correctly age', () {
      final character = CharacterEntity(
        name: 'Harry Potter',
        dateOfBirth: '1988-06-29',
        yearOfBirth: 1993,
        photo: 'any_url',
      );

      final ageByDateBirth = character.ageInYears();
      final ageByYearBirth = character.yearsOld();

      expect(ageByDateBirth, 35);
      expect(ageByYearBirth, 30);
    });

    test('Should throw a FormatException when date is invalid', () {
      const String invalidDate = '31-07-1980';

      final character = CharacterEntity(
        name: 'Harry Potter',
        dateOfBirth: invalidDate,
        yearOfBirth: 1988,
        photo: 'any_url',
      );

      expect(character.ageInYears, throwsFormatException);
    });
  });
}
