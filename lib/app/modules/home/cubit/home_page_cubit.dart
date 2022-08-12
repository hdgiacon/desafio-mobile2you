import 'package:bloc/bloc.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final MovieDescriptionService _movieDescriptionService;

  HomePageCubit({required MovieDescriptionService movieDescriptionService})
      : _movieDescriptionService = movieDescriptionService,
        super(HomePageStateInitial());

  void getMovieData() async {
    emit(HomePageStateLoading());

    final dataMovie = await _movieDescriptionService.getMovie();

    emit(HomePageStateData(
      movieTitle: dataMovie['original_title'],
      numLikes: dataMovie['vote_count'],
      numPopularityView: dataMovie['popularity'],
      urlImage: dataMovie['poster_path'],
    ));
  }
}
