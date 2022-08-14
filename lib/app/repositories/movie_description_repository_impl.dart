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

      throw DioError;
    }
  }

  @override
  Future<List> getSimilarMovie(List previousList, int page) async {
    try {
      Response<Map> response = await Dio().get(
        'https://api.themoviedb.org/3/movie/550/similar?api_key=d64b6208431075fda705663b97902386&language=en-US&page=$page',
      );

      return response.data!['results'];
    } on DioError catch (e, s) {
      if (e.type == DioErrorType.receiveTimeout) {
        log('Sem resposta da API', error: e, stackTrace: s);
      }

      throw DioError;
    }
  }

  @override
  Future<List> getAllGenres() async {
    try {
      Response<Map> response = await Dio().get(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=d64b6208431075fda705663b97902386&language=en-US',
      );

      return response.data!['genres'];
    } on DioError catch (e, s) {
      if (e.type == DioErrorType.receiveTimeout) {
        log('Sem resposta da API', error: e, stackTrace: s);
      }

      throw DioError;
    }
  }
}
