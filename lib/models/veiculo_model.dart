class VeiculoModel {
    String placa;
    String marca;

    VeiculoModel({
        required this.placa,
        required this.marca,
    });

    factory VeiculoModel.fromJson(Map<String, dynamic> json) => VeiculoModel(
        placa: json["placa"],
        marca: json["marca"],
    );

    Map<String, dynamic> toJson() => {
        "placa": placa,
        "marca": marca,
    };
}