import 'package:desafio_mobile2you/app/modules/home/home_page.dart';
import 'package:desafio_mobile2you/app/modules/home/home_page_cubit.dart';
import 'package:desafio_mobile2you/app/repositories/movie_description_repository_impl.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(
        movieDescriptionService: MovieDescriptionServiceImpl(
          movieDescriptionRepository: MovieDescriptionRepositoryImpl(),
        ),
      )..getMovieData(),
      child: const HomePage(),
    );
  }
}
