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
    final allGenres = await _movieDescriptionService.getAllGenres();

    final similarGenres = <List<String>>[];

    final aux = <String>[];
    String gender;

    for (var movie in dataSimilarMovie) {
      movie['release_date'] = movie['release_date'].split('-')[0];

      movie['genre_ids'].forEach((movieGenderId) {
        gender = allGenres[allGenres
            .indexWhere((genre) => genre['id'] == movieGenderId)]['name'];

        aux.add(gender);
      });
      similarGenres.add([...aux]);
      aux.clear();
    }

    emit(MovieDescriptionStateData(
      similarMovieData: dataSimilarMovie,
      similarGenres: similarGenres,
    ));
  }
}
