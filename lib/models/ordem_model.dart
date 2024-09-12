import '../../models/evaluation_model.dart';
import '../../models/cliente_model.dart';
import '../../models/veiculo_model.dart';

class OrdemModel {
    String numeroOrdem;
    String dataEntrada;
    String dataProgramada;
    String dataEncerrada;
    String observacao;
    VeiculoModel veiculo;
    ClienteModel cliente;
    List<EvaluationModel> evaluations;

  OrdemModel({
      required this.numeroOrdem,
      required this.dataEntrada,
      required this.dataProgramada,
      required this.dataEncerrada,
      required this.observacao,
      required this.veiculo,
      required this.cliente,
      required this.evaluations,
  });

  factory OrdemModel.fromJson(Map<String, dynamic> json) => OrdemModel(
        numeroOrdem: json["numeroOrdem"],
        dataEntrada: json["dataEntrada"],
        dataProgramada: json["dataProgramada"],
        dataEncerrada: json["dataEncerrada"],
        observacao: json["observacao"],
        veiculo: VeiculoModel.fromJson(json["veiculo"]),
        cliente: ClienteModel.fromJson(json["cliente"]),
        evaluations: List<EvaluationModel>.from(json["evaluations"].map((x) => EvaluationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numeroOrdem": numeroOrdem,
        "dataEntrada": dataEntrada,
        "dataProgramada": dataProgramada,
        "dataEncerrada": dataEncerrada,
        "observacao": observacao,
        "veiculo": veiculo.toJson(),
        "cliente": cliente.toJson(),
        "evaluations": List<dynamic>.from(evaluations.map((x) => x.toJson())),
      };
}
