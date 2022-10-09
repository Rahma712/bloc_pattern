import 'dart:core';
import 'package:bloc_pattern/data/models/characters.dart';
import 'package:bloc_pattern/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices characterWebServices;

  CharactersRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
