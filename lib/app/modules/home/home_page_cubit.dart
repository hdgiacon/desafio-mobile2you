import 'package:bloc/bloc.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final MovieDescriptionService _movieDescriptionService;

  HomePageCubit({required MovieDescriptionService movieDescriptionService})
      : _movieDescriptionService = movieDescriptionService,
        super(HomePageStateInitial());

  void getMovieData() async {
    final data = await _movieDescriptionService.getMovie();

    emit(HomePageStateData(
      movieTitle: data['original_title'],
      numLikes: data['vote_count'],
      numPopularityView: data['popularity'],
      listMovie: 'similar',
      urlImage: data['poster_path'],
    ));
  }
}
