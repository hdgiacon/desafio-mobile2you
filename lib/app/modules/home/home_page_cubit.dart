import 'package:bloc/bloc.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final MovieDescriptionService _movieDescriptionService;

  HomePageCubit({required MovieDescriptionService movieDescriptionService})
      : _movieDescriptionService = movieDescriptionService,
        super(HomePageStateInitial());

  void getMovieData() async {
    final dataMovie = await _movieDescriptionService.getMovie();

    final dataSimilarMovie = await _movieDescriptionService.getSimilarMovie();

    emit(HomePageStateData(
      movieTitle: dataMovie['original_title'],
      numLikes: dataMovie['vote_count'],
      numPopularityView: dataMovie['popularity'],
      listSimilarMovie: dataSimilarMovie,
      urlImage: dataMovie['poster_path'],
    ));
  }
}
