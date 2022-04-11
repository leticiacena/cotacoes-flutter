import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'package:desafio/blocs/bloc.dart';
import 'package:desafio/components/homePage.dart';
import 'package:desafio/models/enum.dart';
import 'package:desafio/repository/api_call.dart';
import 'package:desafio/models/coins_dto.dart';
import 'package:desafio/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

main() async {
  //final list = ['BRL', 'EUR', 'BTC'];
  //Repositorio().getCoins('USD', list);
  //debugPrint(Repositorio().getCoins().toString());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentThemeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: currentThemeMode,
      darkTheme: CotationTheme.dark,
      home: BlocProvider(
        create: ((context) => ConversionBloc(Repositorio(), <String>[])),
        child: const ConversionMain(),
      ), //chamar de algo assim cada tela
    );
  }
}
