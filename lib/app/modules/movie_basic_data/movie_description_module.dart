import 'package:desafio_mobile2you/app/modules/movie_basic_data/cubit/movie_description_cubit.dart';
import 'package:desafio_mobile2you/app/modules/movie_basic_data/movie_description.dart';
import 'package:desafio_mobile2you/app/repositories/movie_description_repository_impl.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDescriptionModule extends StatelessWidget {
  final String movieTitle;
  final int numLikes;
  final double numPopularityView;

  const MovieDescriptionModule({
    super.key,
    required this.movieTitle,
    required this.numLikes,
    required this.numPopularityView,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDescriptionCubit(
        movieDescriptionService: MovieDescriptionServiceImpl(
          movieDescriptionRepository: MovieDescriptionRepositoryImpl(),
        ),
      )..getSimilarMovieData(),
      child: MovieDescription(
        movieTitle: movieTitle,
        numLikes: numLikes,
        numPopularityView: numPopularityView,
      ),
    );
  }
}
