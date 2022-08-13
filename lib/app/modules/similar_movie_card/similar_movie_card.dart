import 'package:flutter/material.dart';

class SimilarMovieCard extends StatelessWidget {
  final String similarPosterPath;
  final String similarName;
  final String similarYear;
  final String similarGenres;

  const SimilarMovieCard({
    super.key,
    required this.similarPosterPath,
    required this.similarName,
    required this.similarYear,
    required this.similarGenres,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: Row(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original/$similarPosterPath',
          ),
          const SizedBox(width: 15.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Text(
                    similarName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    similarYear,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      similarGenres,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
