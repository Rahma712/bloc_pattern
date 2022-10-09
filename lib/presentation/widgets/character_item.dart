import 'package:bloc_pattern/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/presentation/screens/character.dart';
import 'package:flutter/widgets.dart';
class CharacterItem extends StatelessWidget {
    final Character character;
   const CharacterItem({required this.character,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          margin: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(8.0) ,
          ),
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child:character.image.isNotEmpty?
          FadeInImage.assetNetwork(
            width: double.infinity,
              height: double.infinity,
              placeholder: 'assets/images/loading.gif', image: character.image,fit: BoxFit.cover,) :Image.asset('assets/images/error.jpg'),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(character.name,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
        );

  }
}
