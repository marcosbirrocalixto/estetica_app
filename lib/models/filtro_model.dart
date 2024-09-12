class FiltroModel {
    String description;

    FiltroModel({
        required this.description,
    });

    factory FiltroModel.fromJson(Map<String, dynamic> json) => FiltroModel(
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
    };
}
