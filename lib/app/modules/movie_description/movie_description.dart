import 'package:desafio_mobile2you/app/core/ui/like_icon.dart';
import 'package:desafio_mobile2you/app/core/ui/popularity_icon.dart';
import 'package:desafio_mobile2you/app/modules/movie_card/movie_card.dart';
import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  final String movieTitle;
  final int numLikes;
  final double numPopularityView;
  final String listMovie;

  const MovieDescription({
    super.key,
    required this.movieTitle,
    required this.numLikes,
    required this.numPopularityView,
    required this.listMovie,
  });

  @override
  Widget build(BuildContext context) {
    const listCard = [
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
      MovieCard(),
    ];

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
          const SizedBox(height: 20.0),
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
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: listCard.length,
            itemBuilder: (context, index) {
              return listCard[index];
            },
          )
        ],
      ),
    );
  }
}
