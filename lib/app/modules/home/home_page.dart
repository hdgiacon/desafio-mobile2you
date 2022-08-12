import 'package:desafio_mobile2you/app/modules/home/cubit/home_page_cubit.dart';
import 'package:desafio_mobile2you/app/modules/movie_basic_data/movie_description_module.dart';
import 'package:desafio_mobile2you/app/modules/movie_image/movie_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0b0b),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageStateData) {
                return Column(
                  children: [
                    MovieImage(urlImage: state.urlImage),
                    /*
                    MovieDescription(
                      movieTitle: state.movieTitle,
                      numLikes: state.numLikes,
                      numPopularityView: state.numPopularityView,
                    )
										*/
                    MovieDescriptionModule(
                      movieTitle: state.movieTitle,
                      numLikes: state.numLikes,
                      numPopularityView: state.numPopularityView,
                    )
                  ],
                );
              } else if (state is HomePageStateLoading) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              }

              return const Text(
                'Nenhum dado foi buscado',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
