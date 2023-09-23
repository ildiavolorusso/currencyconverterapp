import 'package:currencyconverterapp/ui/converter_screen.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

void main() async{
  await Isar.initializeIsarCore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/' : (context) => const ConverterScreen()},
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
