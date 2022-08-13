import 'package:flutter/material.dart';

class SimilarMovieCard extends StatelessWidget {
  final String similarPosterPath;
  final String similarName;
  final String similarYear;
  final List<String> similarGenres;

  const SimilarMovieCard({
    super.key,
    required this.similarPosterPath,
    required this.similarName,
    required this.similarYear,
    required this.similarGenres,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
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
                Row(
                  children: [
                    Text(
                      similarYear,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    SizedBox(
                      height: 15.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Text(
                          ', ',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        itemCount: similarGenres.length,
                        itemBuilder: (context, index) {
                          return Text(
                            similarGenres[index],
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
