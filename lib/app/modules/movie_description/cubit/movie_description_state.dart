part of 'movie_description_cubit.dart';

abstract class MovieDescriptionState {}

class MovieDescriptionStateInitial extends MovieDescriptionState {}

class MovieDescriptionStateLoading extends MovieDescriptionState {}

class MovieDescriptionStateData extends MovieDescriptionState {
  final List similarMovieData;
  final List<String> similarGenres;
  final int page;

  MovieDescriptionStateData({
    required this.similarMovieData,
    required this.similarGenres,
    required this.page,
  });
}
