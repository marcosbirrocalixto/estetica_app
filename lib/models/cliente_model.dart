class ClienteModel {
    String name;
    String email;

    ClienteModel({
        required this.name,
        required this.email,
    });

    factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
    };
}