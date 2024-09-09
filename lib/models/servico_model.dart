class ServicoModel {
    String servicoId;
    String nomeservico;
    String descriptionServico;
    String ordemservicoId;
    String tempoRealizado;
    String kmentrega;
    String tempoPrevisto;
    String idOrdemServico;
    String idfuncionario;
    String nomefuncionario;

    ServicoModel({
        required this.servicoId,
        required this.nomeservico,
        required this.descriptionServico,
        required this.ordemservicoId,
        required this.tempoRealizado,
        required this.kmentrega,
        required this.tempoPrevisto,
        required this.idOrdemServico,
        required this.idfuncionario,
        required this.nomefuncionario,
    });

    factory ServicoModel.fromJson(Map<String, dynamic> json) => ServicoModel(
        servicoId: json["servicoId"],
        nomeservico: json["nomeservico"],
        descriptionServico: json["descriptionServico"],
        ordemservicoId: json["ordemservico_id"],
        tempoRealizado: json["tempoRealizado"],
        kmentrega: json["kmentrega"],
        tempoPrevisto: json["tempoPrevisto"],
        idOrdemServico: json["idOrdemServico"],
        idfuncionario: json["idfuncionario"],
        nomefuncionario: json["nomefuncionario"],
    );

    Map<String, dynamic> toJson() => {
        "servicoId": servicoId,
        "nomeservico": nomeservico,
        "descriptionServico": descriptionServico,
        "ordemservico_id": ordemservicoId,
        "tempoRealizado": tempoRealizado,
        "kmentrega": kmentrega,
        "tempoPrevisto": tempoPrevisto,
        "idOrdemServico": idOrdemServico,
        "idfuncionario": idfuncionario,
        "nomefuncionario": nomefuncionario,
    };
}
