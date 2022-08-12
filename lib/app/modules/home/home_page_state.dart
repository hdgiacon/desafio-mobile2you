part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageStateInitial extends HomePageState {}

class HomePageStateData extends HomePageState {
  final String movieTitle;
  final int numLikes;
  final double numPopularityView;
  final List listSimilarMovie;
  final String urlImage;

  HomePageStateData({
    required this.movieTitle,
    required this.numLikes,
    required this.numPopularityView,
    required this.listSimilarMovie,
    required this.urlImage,
  });
}
