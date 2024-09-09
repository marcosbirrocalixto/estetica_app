class OrdemModel {
    String numeroOrdem;
    String dataEntrada;
    String dataProgramada;
    String dataEncerrada;
    String observacao;

  OrdemModel({
      required this.numeroOrdem,
      required this.dataEntrada,
      required this.dataProgramada,
      required this.dataEncerrada,
      required this.observacao,
  });

  factory OrdemModel.fromJson(Map<String, dynamic> json) => OrdemModel(
        numeroOrdem: json["numeroOrdem"],
        dataEntrada: json["dataEntrada"],
        dataProgramada: json["dataProgramada"],
        dataEncerrada: json["dataEncerrada"],
        observacao: json["observacao"],
      );

  Map<String, dynamic> toJson() => {
        "numeroOrdem": numeroOrdem,
        "dataEntrada": dataEntrada,
        "dataProgramada": dataProgramada,
        "dataEncerrada": dataEncerrada,
        "observacao": observacao,
      };
}
