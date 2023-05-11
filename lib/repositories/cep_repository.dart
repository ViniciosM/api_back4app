import 'package:api_back4app/models/cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/address_model.dart';

class CepRepository {
  Future<AddressModel> getAddress({required String cep}) async {
    try {
      Dio dio = Dio();
      final result = await dio.get('https://viacep.com.br/ws/$cep/json/');
      await _saveCEP(cep: cep);
      if (result.statusCode == 200) {
        return AddressModel.fromJson(result.data);
      } else {
        return AddressModel.empty();
      }
    } catch (e) {
      debugPrint(e.toString());
      return AddressModel.empty();
    }
  }

  Future<void> _saveCEP({required String cep}) async {
    try {
      Dio dio = Dio();
      bool cepFound = false;
      dio.options.headers = {
        "X-Parse-Application-Id": "kprYTDhXeU1RNKZJRi10ZwZsqnSNGFIVQsn2Jjal",
        "X-Parse-REST-API-Key": "X3giyo7VXnfhCkYlrqJIc8ZKSW9kGObOTKMbqd19",
        "Content-Type": "application/json",
      };

      final result = await dio.get('https://parseapi.back4app.com/classes/CEP');

      CepModel ceps = CepModel.fromJson(result.data);

      for (var element in ceps.results) {
        if (cep == element.cep) {
          cepFound = true;
        }
      }

      if (!cepFound && result.statusCode == 200) {
        debugPrint('Entrou no IF');
        await dio.post(
          'https://parseapi.back4app.com/classes/CEP',
          data: {"cep": cep},
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
