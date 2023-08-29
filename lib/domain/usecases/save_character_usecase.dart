abstract interface class SaveCharacter {
  Future<void> call(SaveCharacterUseCaseParams params);
}

class SaveCharacterUseCase implements SaveCharacter {
  @override
  Future<void> call(SaveCharacterUseCaseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class SaveCharacterUseCaseParams {
  final String _name;
  final int _age;

  SaveCharacterUseCaseParams(this._name, this._age);

  String get getName {
    return _name;
  }
}
