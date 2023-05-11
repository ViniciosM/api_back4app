import 'package:api_back4app/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

import '../models/address_model.dart';

class HomeController extends ChangeNotifier {
  final CepRepository cepRepository;
  HomeController({
    required this.cepRepository,
  });

  ValueNotifier<AddressModel> address =
      ValueNotifier<AddressModel>(AddressModel.empty());

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> getAddress({required String cep}) async {
    try {
      isLoading.value = true;

      final result = await cepRepository.getAddress(cep: cep);
      if (result != address.value) {
        address.value = result;
        isLoading.value = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading.value = false;

      debugPrint(e.toString());
    }
  }
}
