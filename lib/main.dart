import 'package:api_back4app/repositories/cep_repository.dart';
import 'package:api_back4app/view/home_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CepRepository cepRepository = CepRepository();
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)),
    debugShowCheckedModeBanner: false,
    home: HomeView(
      cepRepository: cepRepository,
    ),
  ));
}
