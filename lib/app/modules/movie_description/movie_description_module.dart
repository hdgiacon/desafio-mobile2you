import 'package:desafio_mobile2you/app/models/movie_model.dart';
import 'package:desafio_mobile2you/app/modules/movie_description/cubit/movie_description_cubit.dart';
import 'package:desafio_mobile2you/app/modules/movie_description/movie_description.dart';
import 'package:desafio_mobile2you/app/repositories/movie_description_repository_impl.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDescriptionModule extends StatelessWidget {
  final MovieModel movieModel;

  const MovieDescriptionModule({
    super.key,
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDescriptionCubit(
        movieDescriptionService: MovieDescriptionServiceImpl(
          movieDescriptionRepository: MovieDescriptionRepositoryImpl(),
        ),
      )..getSimilarMovieData([], 1),
      child: MovieDescription(
        movieModel: movieModel,
      ),
    );
  }
}
