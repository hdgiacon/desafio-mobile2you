import 'dart:developer';

import 'package:desafio_mobile2you/app/repositories/movie_description_repository.dart';
import 'package:dio/dio.dart';

class MovieDescriptionRepositoryImpl implements MovieDescriptionRepository {
  @override
  Future<Map> getMovie() async {
    try {
      Response<Map> response = await Dio().get(
        'https://api.themoviedb.org/3/movie/550?api_key=d64b6208431075fda705663b97902386&language=en-US',
      );

      return response.data!;
    } on DioError catch (e, s) {
      if (e.type == DioErrorType.receiveTimeout) {
        log('Sem resposta da API', error: e, stackTrace: s);
      }

      throw Exception;
    }
  }
}
