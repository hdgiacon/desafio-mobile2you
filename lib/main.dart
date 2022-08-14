import 'package:desafio_mobile2you/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      title: 'Desafio Mobile2You',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (_) => const AppModule(),
      },
    ),
  );
}
