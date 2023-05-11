class AddressModel {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  AddressModel.empty({
    this.cep = "",
    this.logradouro = "",
    this.complemento = "",
    this.bairro = "",
    this.localidade = "",
    this.uf = "",
  });

  AddressModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  AddressModel copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
  }) =>
      AddressModel(
        cep: cep ?? this.cep,
        logradouro: logradouro ?? this.logradouro,
        complemento: complemento ?? this.complemento,
        bairro: bairro ?? this.bairro,
        localidade: localidade ?? this.localidade,
        uf: uf ?? this.uf,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
      );

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
      };
}
