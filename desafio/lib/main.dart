import 'package:desafio/components/mainUI.dart';
import 'package:desafio/resources/strings.dart';
import 'package:desafio/resources/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      home: const ConversionMain(), //chamar de algo assim cada tela
    );
  }
}
