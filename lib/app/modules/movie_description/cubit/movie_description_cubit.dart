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

    var currentGenres = <String>[];

    final similarGenres = <String>[];

    for (var movie in dataSimilarMovie) {
      movie['release_date'] = _getYear(movie);

      currentGenres = _getGenres(movie, allGenres);

      similarGenres.add([...currentGenres].join(', '));
      currentGenres.clear();
    }

    emit(MovieDescriptionStateData(
      similarMovieData: dataSimilarMovie,
      similarGenres: similarGenres,
    ));
  }

  dynamic _getYear(dynamic movie) {
    return movie['release_date'].split('-')[0];
  }

  List<String> _getGenres(dynamic movie, List<dynamic> allGenres) {
    String genre;
    final currentGenres = <String>[];

    movie['genre_ids'].forEach((movieGenderId) {
      genre = allGenres[allGenres
          .indexWhere((genre) => genre['id'] == movieGenderId)]['name'];

      currentGenres.add(genre);
    });

    return currentGenres;
  }
}
