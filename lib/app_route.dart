import 'package:bloc_pattern/business_logic/characters_cubit.dart';
import 'package:bloc_pattern/data/repository/characters_repository.dart';
import 'package:bloc_pattern/data/web_services/characters_web_services.dart';
import 'package:bloc_pattern/presentation/screens/characters.dart';
import 'package:bloc_pattern/presentation/screens/character_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';



class AppRoute {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit ;

  AppRoute(){
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
   Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case characterScreen:
        return MaterialPageRoute(builder: (_)=> BlocProvider(
          create:  (BuildContext context)=> CharactersCubit(charactersRepository),
          child: const CharactersScreen(),
        ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_)=> const CharacterDetailsScreen());

    }

  }
}