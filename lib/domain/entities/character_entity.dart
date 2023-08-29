/// As entidades são regras de negócio da empresa, de nível mais alto.
/// São objetos de negócio da aplicação e não devem mudar com frequência.
/// Geralmente regras independentes (não necessitam de nada externo).
/// Externo seja libs, json, etc...(puras, é claro quando possível).

class CharacterEntity {
  final String? id;
  final String name;
  final String dateOfBirth;
  final int yearOfBirth;
  final String photo;

  CharacterEntity({
    this.id,
    required this.name,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.photo,
  });

  int ageInYears() {
    DateTime birthDate = DateTime.parse(dateOfBirth);
    Duration diff = DateTime.now().difference(birthDate);
    return diff.inDays ~/ 365;
  }

  int yearsOld() {
    return DateTime.now().year - yearOfBirth;
  }
}
