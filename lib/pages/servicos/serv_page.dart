import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/custom_circular_progress_indicator.dart';
import '../../models/filtro_model.dart';
import '../../models/servico_model.dart';
import '../../widgets/filtros.dart';
import '../../models/ordem_model.dart';
import '../../pages/servicos/widgets/ServicoCard.dart';
import '../../stores/services_store.dart';
import '../../widgets/botoom_navigator.dart';

class ServicosPage extends StatefulWidget {
  const ServicosPage({super.key});

  @override
  State<ServicosPage> createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  late OrdemModel _ordem;
  String filtro = '';
  ServicesStore storeServices = ServicesStore();

  List<FiltroModel> _filtros = [
    FiltroModel(description: 'Abertos'),
    FiltroModel(description: 'Todos'),
    FiltroModel(description: 'Fechados'),
  ];

  @override
  void initState() {
    //placa = widget.placa;

    super.initState();

    //print(placa);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RouteSettings settings = ModalRoute.of(context)!.settings;
    _ordem = settings.arguments as OrdemModel;

      storeServices.getServices(_ordem.numeroOrdem);
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Serviços da OS N° "),
            Text(_ordem.numeroOrdem.toString()),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 250, 250, 251),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        toolbarTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Column(
        children: [
          FiltrosWidget(_filtros),
          Observer(
            builder: (context) {
              return storeServices.isLoading
                  ? CustomCircularProgressIndicator(
                      width: 50,
                      height: 50,
                      textLabel: 'Carregando os Serviços...')
                  : storeServices.services.length == 0
                      ? Center(
                          child: Text(
                          'Nenhum Servço cadastrado!!!',
                          style: TextStyle(color: Colors.black),
                        ))
                      : _buildServicos();
            },
          ),
        ],
      ),
      bottomNavigationBar: BotoomNavigator(1),
    );
  }

  Widget _buildServicos() {
    return Container(
      height: (MediaQuery.of(context).size.height - 200),
      width: MediaQuery.of(context).size.width,
      //color: Colors.black,
      child: ListView.builder(
        itemCount: storeServices.services.length,
        itemBuilder: (context, index) {
          final ServicoModel servico = storeServices.services[index];
          return ServicoCard(
              servicoId: servico.servicoId.toString(),
              nomeservico: servico.nomeservico,
              descriptionServico: servico.descriptionServico,
              ordemservicoId: servico.ordemservicoId.toString(),
              tempoRealizado: servico.tempoRealizado,
              kmentrega: servico.kmentrega.toString(),
              tempoPrevisto: servico.tempoPrevisto,
              idOrdemServico: servico.idOrdemServico.toString(),
              idfuncionario: servico.idfuncionario.toString(),
              nomefuncionario: servico.nomefuncionario);
        },
      ),
    );
  }
}
