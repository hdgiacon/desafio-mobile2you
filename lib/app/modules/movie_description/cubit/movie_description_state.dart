part of 'movie_description_cubit.dart';

abstract class MovieDescriptionState {}

class MovieDescriptionStateInitial extends MovieDescriptionState {}

class MovieDescriptionStateLoading extends MovieDescriptionState {}

class MovieDescriptionStateData extends MovieDescriptionState {
  final List similarMovieData;
  final List<List<String>> similarGenres;

  MovieDescriptionStateData({
    required this.similarMovieData,
    required this.similarGenres,
  });
}
