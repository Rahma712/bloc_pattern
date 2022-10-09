import 'package:bloc_pattern/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {

  late Dio dio;
    CharactersWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,//60 second
      receiveTimeout: 60 * 1000,

    );

    dio = Dio(options);

  }

   Future<List<dynamic>>getAllCharacters() async {

      try{
        Response response =  await dio.get('characters');
        print(response.data.toString());
        return response.data;

      }catch(error){
        print(error.toString());
        return [];
      }





}

}