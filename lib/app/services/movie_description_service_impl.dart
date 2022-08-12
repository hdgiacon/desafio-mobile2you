import 'package:desafio_mobile2you/app/repositories/movie_description_repository.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service.dart';

class MovieDescriptionServiceImpl implements MovieDescriptionService {
  final MovieDescriptionRepository _movieDescriptionRepository;

  MovieDescriptionServiceImpl(
      {required MovieDescriptionRepository movieDescriptionRepository})
      : _movieDescriptionRepository = movieDescriptionRepository;

  @override
  Future<Map> getMovie() => _movieDescriptionRepository.getMovie();

  @override
  Future<List> getSimilarMovie() =>
      _movieDescriptionRepository.getSimilarMovie();
}
