import 'package:flutter/material.dart';
//import 'pages/converter_page.dart';
import 'pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // aquí agregamos el MaterialApp al árbol de widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mision Tic NCR2288 - Currency converter - Grupo 12',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        //home: const ConverterPage());
        home: const SplashScreen());
  }
}
