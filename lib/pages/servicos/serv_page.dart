import 'package:flutter/material.dart';

import '../../models/servico_model.dart';
import '../../models/ordem_model.dart';
import '../../pages/servicos/widgets/ServicoCard.dart';
import '../../widgets/botoom_navigator.dart';

class ServicosPage extends StatefulWidget {
  const ServicosPage({super.key});

  @override
  State<ServicosPage> createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  OrdemModel _ordens = OrdemModel(
      numeroOrdem: "1",
      dataEntrada: '09/09/2024',
      dataProgramada: '09/09/2024',
      dataEncerrada: '09/09/2024',
      observacao:
          'Observação de teste dfgdfg dfgdgd sddfsd sdfsdfsdf sdfsdfsdf Observação de teste dfgdfg dfgdgd sddfsd sdfsdfsdf sdfsdfsdf',
  );

  final _filtros = ['Em execução', 'Finalizados', 'Todos'];

  List<ServicoModel> _servicos = [
    ServicoModel(
      servicoId: '1',
      nomeservico: 'Serviço 1',
      descriptionServico: 'Descrição 1',
      ordemservicoId: '1',
      tempoRealizado: '20 min',
      kmentrega: '50',
      tempoPrevisto: 'Serviço 1',
      idOrdemServico: '1',
      idfuncionario: '1',
      nomefuncionario: 'Fernanda',
    ),
    ServicoModel(
      servicoId: '2',
      nomeservico: 'Serviço 2',
      descriptionServico: 'Descrição 2',
      ordemservicoId: '2',
      tempoRealizado: '',
      kmentrega: '50',
      tempoPrevisto: '50',
      idOrdemServico: '2',
      idfuncionario: '2',
      nomefuncionario: 'Isabela',
    ),
    ServicoModel(
      servicoId: '3',
      nomeservico: 'Serviço 3',
      descriptionServico: 'Descrição 3',
      ordemservicoId: '3',
      tempoRealizado: '20 min',
      kmentrega: '50',
      tempoPrevisto: 'Serviço 3',
      idOrdemServico: '3',
      idfuncionario: '3',
      nomefuncionario: 'Fernanda',
    ),
    ServicoModel(
      servicoId: '4',
      nomeservico: 'Serviço 4',
      descriptionServico: 'Descrição 4',
      ordemservicoId: '4',
      tempoRealizado: '20 min',
      kmentrega: '50',
      tempoPrevisto: 'Serviço 4',
      idOrdemServico: '4',
      idfuncionario: '4',
      nomefuncionario: 'Isabela',
    ),
    ServicoModel(
      servicoId: '5',
      nomeservico: 'Serviço 5',
      descriptionServico: 'Descrição 5',
      ordemservicoId: '5',
      tempoRealizado: '20 min',
      kmentrega: '50',
      tempoPrevisto: 'Serviço 5',
      idOrdemServico: '5',
      idfuncionario: '5',
      nomefuncionario: 'Fernanda',
    ),
    ServicoModel(
      servicoId: '6',
      nomeservico: 'Serviço 6',
      descriptionServico: 'Descrição 6',
      ordemservicoId: '6',
      tempoRealizado: '',
      kmentrega: '60',
      tempoPrevisto: '20',
      idOrdemServico: '6',
      idfuncionario: '6',
      nomefuncionario: 'Fernanda',
    ),
    ServicoModel(
      servicoId: '7',
      nomeservico: 'Serviço 7',
      descriptionServico: 'Descrição 7',
      ordemservicoId: '7',
      tempoRealizado: '20 min',
      kmentrega: '70',
      tempoPrevisto: 'Serviço 7',
      idOrdemServico: '7',
      idfuncionario: '7',
      nomefuncionario: 'Fernanda',
    ),
  ];

  @override
  void initState() {
    //placa = widget.placa;

    super.initState();

    //print(placa);
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Serviços da OS N° "),
            Text(_ordens.numeroOrdem.toString()),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 250, 250, 251),
            fontSize: 30,
            fontWeight: FontWeight.bold),
        toolbarTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Column(
        children: [
          _buildFiltros(context),
          _buildServicos(context),
        ],
      ),
      bottomNavigationBar: BotoomNavigator(1),
    );
  }

  Widget _buildFiltros(context) {
    return Container(
        padding: EdgeInsets.only(top: 1),
        height: 50,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _filtros.length,
            itemBuilder: (context, index) {
              final filtro = _filtros[index];
              return _buildFiltro(filtro);
            },
          ),
        ));
  }

  Widget _buildFiltro(filtro) {
    return Container(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: filtro == 'Abertas' ? Colors.red : Colors.grey)),
        child: Center(
          child: Text(
            filtro,
            style: TextStyle(
                color: filtro == 'Abertas'
                    ? Colors.red
                    : Color.fromARGB(255, 14, 14, 75),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget _buildServicos(context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 200),
      width: MediaQuery.of(context).size.width,
      //color: Colors.black,
      child: ListView.builder(
        itemCount: _servicos.length,
        itemBuilder: (context, index) {
          final ServicoModel servico = _servicos[index];
          return ServicoCard(
              servicoId: servico.servicoId,
              nomeservico: servico.nomeservico,
              descriptionServico: servico.descriptionServico,
              ordemservicoId: servico.ordemservicoId,
              tempoRealizado: servico.tempoRealizado,
              kmentrega: servico.kmentrega,
              tempoPrevisto: servico.tempoPrevisto,
              idOrdemServico: servico.idOrdemServico,
              idfuncionario: servico.idfuncionario,
              nomefuncionario: servico.nomefuncionario);
        },
      ),
    );
  }
}
