part of 'movie_description_cubit.dart';

abstract class MovieDescriptionState {}

class MovieDescriptionStateInitial extends MovieDescriptionState {}

class MovieDescriptionStateLoading extends MovieDescriptionState {}

class MovieDescriptionStateData extends MovieDescriptionState {
  final List similarMovieData;

  MovieDescriptionStateData({
    required this.similarMovieData,
  });
}
