import 'package:flutter/material.dart';

class ServicoCard extends StatelessWidget {
  //ServicoModel; Posso tazer objeto inteiro mas ....
    final String servicoId;
    final String nomeservico;
    final String descriptionServico;
    final String ordemservicoId;
    final String tempoRealizado;
    final String kmentrega;
    final String tempoPrevisto;
    final String idOrdemServico;
    final String idfuncionario;
    final String nomefuncionario;

  const ServicoCard({
    super.key, 
    this.servicoId = '',
    this.nomeservico = '',
    this.descriptionServico = '',
    this.ordemservicoId = '',
    this.tempoRealizado = '',
    this.kmentrega = '',
    this.tempoPrevisto = '',
    this.idOrdemServico = '',
    this.idfuncionario = '',
    this.nomefuncionario = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 170, 165, 165)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: const Color.fromARGB(255, 250, 250, 250),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 80,
                height: 50,
                child: ClipOval(
                  child: Image.asset('assets/icon/logo.ico'),
                ),
              ),
              //VerticalDivider(color: Color.fromARGB(255, 204, 204, 206)),
              //Expanded(child:
              const Padding(padding: EdgeInsets.only(left: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 7)),
                  Text("Serviço: $nomeservico",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text("Descrição: $descriptionServico",
                      style:
                          const TextStyle(color: Color.fromARGB(197, 0, 0, 0))),
                  Text("Funcionário: $nomefuncionario",
                      style: const TextStyle(color: Colors.black)),
                  if (tempoRealizado != '')
                      Text("Tempo(h): $tempoRealizado?",
                          style: const TextStyle(
                          color: Colors.black)),
                      const Text("Status: Realizado",
                          style: TextStyle(color: Colors.red)),
                  if (tempoRealizado == '')
                      Text("Tempo Previsto(MIn): $tempoPrevisto?",
                      style: const TextStyle(
                          color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
