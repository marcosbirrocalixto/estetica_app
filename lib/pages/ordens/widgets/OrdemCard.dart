import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../models/ordem_model.dart';

class OrdemCard extends StatelessWidget {
  final OrdemModel ordem;

  OrdemCard({
    super.key,
    required this.ordem,
  });

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_Br';
    return GestureDetector(
      onTap: () {
        print("OS: " + ordem.numeroOrdem);
        /*
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => ServicosPage(placa: "$idOrdemServico")),
                (Route<dynamic> route) => false);
        */
        Navigator.pushNamed(context, '/servico', arguments: ordem);
        //Navigator.of(context).pushReplacementNamed('/servicos', arguments: idOrdemServico);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 0, right: 1, left: 1, bottom: 0),
        child: Card(
          elevation: 2.5,
          child: Container(
            //height: stars == 0 ? 210 : 250,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 136, 135, 135)),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: const Color.fromARGB(255, 250, 250, 250),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipOval(
                      child: Image.asset('assets/icon/logo.ico'),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 7)),
                      Text("Ordem de serviço: " + ordem.numeroOrdem,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text("Placa: " + ordem.veiculo.placa,
                          style: const TextStyle(
                              color: Color.fromARGB(197, 0, 0, 0))),
                      Text("Veículo: " + ordem.veiculo.marca,
                          style: const TextStyle(color: Colors.black)),
                      Text("Cliente: " + ordem.cliente.name,
                          style: const TextStyle(color: Colors.black)),
                      Text("Data entrada: " + ordem.dataEntrada,
                          style: const TextStyle(color: Colors.black)),
                      Text("Data programada: " + ordem.dataProgramada,
                          style: const TextStyle(color: Colors.black)),
                      Container(
                        height: 40,
                        width: 320,
                        child: Text(
                            overflow: TextOverflow.clip,
                            "Observação:  " + ordem.observacao,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        child: Text(
                            overflow: TextOverflow.clip,
                            "Avaliação:  ",
                            style: const TextStyle(
                              color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            )),
                      ),
                      _buildEvaluationOrdem(context),
                    ],
                   
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEvaluationOrdem(context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget _evaluationButton(context) {
    double deviceWidth = (MediaQuery.of(context).size.width - 200);
    return SizedBox(
      width: deviceWidth,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/evaluation-order');
        },
        elevation: 5,
        color: Theme.of(context).primaryColor,
        textColor: const Color.fromARGB(255, 251, 251, 249),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Text('Avaliar Serviço'),
      ),
    );
  }
}
