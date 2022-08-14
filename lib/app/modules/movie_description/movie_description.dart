import 'package:desafio_mobile2you/app/core/ui/like_icon.dart';
import 'package:desafio_mobile2you/app/core/ui/popularity_icon.dart';
import 'package:desafio_mobile2you/app/models/movie_model.dart';
import 'package:desafio_mobile2you/app/modules/movie_description/cubit/movie_description_cubit.dart';
import 'package:desafio_mobile2you/app/modules/similar_movie_card/similar_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDescription extends StatelessWidget {
  final MovieModel movieModel;

  MovieDescription({
    super.key,
    required this.movieModel,
  });
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        //controller: controller,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    movieModel.movieTitle,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: LikeIcon(),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  '${movieModel.numLikes} Likes',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 20.0),
                const PopularityIcon(popularity: 10.0),
                const SizedBox(width: 8.0),
                Text(
                  '${movieModel.numPopularityView} view',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            BlocConsumer<MovieDescriptionCubit, MovieDescriptionState>(
              listener: (context, state) {
                controller.addListener(() {
                  /* 
										! este if está correto mas por conta de algum efeito do sliver, os valores da condicional não estão vindo corretos;
										! este if está sendo chamado toda vez que chega ao fim da tela atual e não no fim da lista;
										! a ideia correta é chamar somente ao final da lista para buscar mais uma pagina de filmes similares da API.
									*/
                  if (controller.position.maxScrollExtent ==
                      controller.offset) {
                    debugPrint('entrou no bloc listener consumer');

                    if (state is MovieDescriptionStateData) {
                      context.read<MovieDescriptionCubit>().getSimilarMovieData(
                          state.similarMovieData, state.page);
                    }
                  }
                });
              },
              builder: (context, state) {
                if (state is MovieDescriptionStateData) {
                  return SizedBox(
                    height: 2100.0 * (state.similarMovieData.length / 20),
                    //height: 1000,
                    child: ListView.separated(
                      //physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      controller: controller,
                      //shrinkWrap: true,
                      itemCount: state.similarMovieData.length + 1,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < state.similarMovieData.length) {
                          return SimilarMovieCard(
                            similarPosterPath: state.similarMovieData[index]
                                ['poster_path'],
                            similarName: state.similarMovieData[index]
                                ['original_title'],
                            similarYear: state.similarMovieData[index]
                                ['release_date'],
                            similarGenres: state.similarGenres[index],
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 32.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else if (state is MovieDescriptionStateLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                }

                return const Text(
                  'Nenhum dado foi buscado',
                  style: TextStyle(color: Colors.white),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
