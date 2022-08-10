import 'package:desafio_mobile2you/app/modules/movie_description/movie_description.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0b0b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShaderMask(
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
                'https://img.quizur.com/f/img5ed39b57c38e26.32086864.jpg?lastEdited=1590926178',
              ),
            ),
            const MovieDescription(),
          ],
        ),
      ),
    );
  }
}

/*
ShaderMask(
  shaderCallback: (rect) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black, Colors.transparent],
    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
  },
  blendMode: BlendMode.dstIn,
  child: Image.asset(
    'assets/chrome.png',
    height: 400,
    fit: BoxFit.contain,
  ),
),
*/