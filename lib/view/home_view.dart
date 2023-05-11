import 'package:api_back4app/controllers/home_controller.dart';
import 'package:api_back4app/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({required this.cepRepository, Key? key}) : super(key: key);

  final CepRepository cepRepository;

  @override
  State<HomeView> createState() => _HomeViewState();
}

final _formKey = GlobalKey<FormState>();
late HomeController homeController;
late TextEditingController _cepEC;

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    homeController = HomeController(cepRepository: widget.cepRepository);
    _cepEC = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta e Cadastro - CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _cepEC,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close_outlined),
                    onPressed: () {
                      homeController.getAddress(cep: '');
                      _cepEC.text = '';
                    },
                  ),
                  label: const Text('Informe o CEP'),
                ),
                maxLength: 8,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, informe um cep";
                  } else if (value.length != 8) {
                    return "Por favor, informe 8 caracteres";
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: const Text('Buscar'),
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      await homeController.getAddress(cep: _cepEC.text);
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              ValueListenableBuilder(
                  valueListenable: homeController.address,
                  builder: (context, address, _) {
                    return Visibility(
                      visible: address.bairro.isNotEmpty,
                      child: Container(
                        margin: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Logradouro: ${address.logradouro}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bairro: ${address.bairro}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Localidade - Cidade: ${address.localidade} - ${address.uf}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
