class EvaluationModel {
    String cliente;
    int stars;
    String comment;

    EvaluationModel({
        required this.cliente,
        required this.stars,
        required this.comment,
    });

    factory EvaluationModel.fromJson(Map<String, dynamic> json) => EvaluationModel(
        cliente: json["cliente"],
        stars: json["stars"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "cliente": cliente,
        "stars": stars,
        "comment": comment,
    };
}