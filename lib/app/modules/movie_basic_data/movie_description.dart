import 'package:desafio_mobile2you/app/core/ui/like_icon.dart';
import 'package:desafio_mobile2you/app/core/ui/popularity_icon.dart';
import 'package:desafio_mobile2you/app/modules/movie_basic_data/cubit/movie_description_cubit.dart';
import 'package:desafio_mobile2you/app/modules/movie_card/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDescription extends StatelessWidget {
  final String movieTitle;
  final int numLikes;
  final double numPopularityView;

  const MovieDescription({
    super.key,
    required this.movieTitle,
    required this.numLikes,
    required this.numPopularityView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  movieTitle,
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
                '$numLikes Likes',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(width: 20.0),
              const PopularityIcon(popularity: 10.0),
              const SizedBox(width: 8.0),
              Text(
                '$numPopularityView view',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocBuilder<MovieDescriptionCubit, MovieDescriptionState>(
            builder: (context, state) {
              if (state is MovieDescriptionStateData) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state.similarMovieData.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      similarPosterPath: state.similarMovieData[index]
                          ['poster_path'],
                      similarName: state.similarMovieData[index]
                          ['original_title'],
                      similarYear: state.similarMovieData[index]
                          ['release_date'],
                    );
                  },
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
    );
  }
}
