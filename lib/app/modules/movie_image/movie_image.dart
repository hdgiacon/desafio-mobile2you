import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  final String urlImage;

  const MovieImage({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        'https://image.tmdb.org/t/p/original/$urlImage',
        fit: BoxFit.cover,
      ),
    );
  }
}
