import 'package:bloc_pattern/business_logic/characters_cubit.dart';
import 'package:bloc_pattern/data/models/characters.dart';
import 'package:bloc_pattern/presentation/widgets/character_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);


  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
   List<Character>? allCharacters;
  @override
  void initState() {
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacter();
    super.initState();
  }
  Widget? buildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(builder:(context,state){
      if(state is CharactersLoaded){
        allCharacters=(state).characters;
        return buildLoadedListWidget();

      }else{

        return showLoadingIndicator();

      }

    },);
  }
  Widget showLoadingIndicator(){
    return  const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    ) ;
  }
  Widget buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }
  Widget buildCharacterList(){
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,

    ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics( ),
        padding: EdgeInsets.zero,
        itemCount: allCharacters!.length,
        itemBuilder: (ctx,index){
        return CharacterItem(
          character: allCharacters![index],
        );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Characters',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: buildBlocWidget( ),
    );
  }
}
