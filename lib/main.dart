import 'package:desafio_mobile2you/app/modules/home/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      backgroundColor: const Color(0xff2e2e2e),
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        title: 'Desafio Mobile2You',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    ),
  );
}