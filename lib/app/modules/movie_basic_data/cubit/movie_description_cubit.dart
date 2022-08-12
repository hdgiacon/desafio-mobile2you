import 'package:bloc/bloc.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service.dart';

part 'movie_description_state.dart';

class MovieDescriptionCubit extends Cubit<MovieDescriptionState> {
  final MovieDescriptionService _movieDescriptionService;

  MovieDescriptionCubit(
      {required MovieDescriptionService movieDescriptionService})
      : _movieDescriptionService = movieDescriptionService,
        super(MovieDescriptionStateInitial());

  void getSimilarMovieData() async {
    emit(MovieDescriptionStateLoading());

    final dataSimilarMovie = await _movieDescriptionService.getSimilarMovie();

    emit(MovieDescriptionStateData(
      similarMovieData: dataSimilarMovie,
    ));
  }
}
