class CepModel {
  List<Result> results;

  CepModel({
    required this.results,
  });

  CepModel copyWith({
    List<Result>? results,
  }) =>
      CepModel(
        results: results ?? this.results,
      );

  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String objectId;
  String cep;

  Result({
    required this.objectId,
    required this.cep,
  });

  Result copyWith({
    String? objectId,
    String? cep,
  }) =>
      Result(
        objectId: objectId ?? this.objectId,
        cep: cep ?? this.cep,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        objectId: json["objectId"],
        cep: json["cep"],
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "cep": cep,
      };
}
