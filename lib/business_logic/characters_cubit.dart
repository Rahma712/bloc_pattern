import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/data/models/characters.dart';
import 'package:bloc_pattern/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final CharactersRepository charactersRepository;
   List<Character>characters=[];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character>?getAllCharacter(){
    charactersRepository.getAllCharacters().then((characters) => {
      emit(CharactersLoaded(characters)),
      this.characters=characters,
    });
    return characters;
  }

}
