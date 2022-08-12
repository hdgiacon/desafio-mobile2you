import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String similarPosterPath;
  final String similarName;
  final String similarYear;

  const MovieCard({
    super.key,
    required this.similarPosterPath,
    required this.similarName,
    required this.similarYear,
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
              Text(
                similarName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  overflow: TextOverflow.clip,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                similarYear,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
