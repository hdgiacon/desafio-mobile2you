import 'package:desafio_mobile2you/app/modules/home/home_page.dart';
import 'package:desafio_mobile2you/app/modules/home/home_page_cubit.dart';
import 'package:desafio_mobile2you/app/repositories/movie_description_repository_impl.dart';
import 'package:desafio_mobile2you/app/services/movie_description_service_impl.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      backgroundColor: const Color(0xff2e2e2e),
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        initialRoute: '/home',
        title: 'Desafio Mobile2You',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/home': (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => HomePageCubit(
                      movieDescriptionService: MovieDescriptionServiceImpl(
                        movieDescriptionRepository:
                            MovieDescriptionRepositoryImpl(),
                      ),
                    )..getMovieData(),
                  )
                ],
                child: const HomePage(),
              ),
        },
      ),
    ),
  );
}
