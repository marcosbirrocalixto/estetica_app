import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class OrdemCard extends StatelessWidget {
  final String numeroOrdem;
  final String dataEntrada;
  final String dataProgramada;
  final String observacao;

  OrdemCard({
    super.key,
    this.numeroOrdem = '',
    this.dataEntrada = '',
    this.dataProgramada = '',
    this.observacao = '',
  });

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_Br';
    return GestureDetector(
      onTap: () {
        print("OS: $numeroOrdem");
        /*
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => ServicosPage(placa: "$idOrdemServico")),
                (Route<dynamic> route) => false);
        */
        Navigator.pushNamed(context, '/servico', arguments: numeroOrdem);
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
              color: const Color.fromARGB(237, 253, 253, 252),
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
                  //VerticalDivider(color: Color.fromARGB(255, 204, 204, 206)),
                  //Expanded(child:
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 7)),
                      Text("Ordem de serviço: $numeroOrdem",
                          style: const TextStyle(
                              color: Colors.black,
                       
                          fontWeight: FontWeight.bold)),
                          /*
                      Text("Placa: $placa",
                          style: const TextStyle(
                              color: Color.fromARGB(197, 0, 0, 0))),
                      Text("Veículo: $marca",
                          style: const TextStyle(color: Colors.black)),
                      Text("Cliente: $nome",
                          style: const TextStyle(color: Colors.black)),
                      */
                      Text("Data entrada: $dataEntrada",
                          style: const TextStyle(color: Colors.black)),
                      Text("Data programada: $dataProgramada",
                          style: const TextStyle(color: Colors.black)),
                      Container(
                        height: 40,
                        width: 320,
                        child: Text(
                            overflow: TextOverflow.clip,
                            "Observação:  $observacao",
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      //Container(height: 5),
                      /*
                      if (stars != 0)
                        Text(
                          'Avaliação:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (stars != 0)
                        Container(
                          child: RatingBar.builder(
                            initialRating: stars.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 30,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              null;
                            },
                          ),
                        ),
                      if (stars != 0)
                        Container(
                          child: Text(
                            comment,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (stars == 0)
                        Container(
                          child: _placaButton(context),
                        )
                      */
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

  Widget _placaButton(context) {
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
