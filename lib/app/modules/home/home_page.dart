import 'package:desafio_mobile2you/app/models/movie_model.dart';
import 'package:desafio_mobile2you/app/modules/home/cubit/home_page_cubit.dart';
import 'package:desafio_mobile2you/app/modules/movie_description/movie_description_module.dart';
import 'package:desafio_mobile2you/app/modules/movie_image/movie_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      backgroundColor: const Color(0xff0b0b0b),
      body: Center(
        child: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (state is HomePageStateData) {
              return CustomScrollView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    backgroundColor: Colors.transparent,
                    expandedHeight: MediaQuery.of(context).size.height * .6,
                    flexibleSpace: FlexibleSpaceBar(
                      background: MovieImage(urlImage: state.urlImage),
                      stretchModes: const [StretchMode.zoomBackground],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MovieDescriptionModule(
                          movieModel: MovieModel(
                            movieTitle: state.movieTitle,
                            numLikes: state.numLikes,
                            numPopularityView: state.numPopularityView,
                          ),
                        );
                      },
                      childCount: 1,
                    ),
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
    );
  }
}
