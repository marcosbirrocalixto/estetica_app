import 'package:flutter/material.dart';

import '../../models/ordem_model.dart';
import 'widgets/OrdemCard.dart';
import '../../data/repositories/ordem_repository.dart';
import '../../widgets/botoom_navigator.dart';

class OrdemPage extends StatefulWidget {
  final String placa;
  const OrdemPage({super.key, required this.placa});

  @override
  State<OrdemPage> createState() => _OrdemPageState();
}

class _OrdemPageState extends State<OrdemPage> {
  late dynamic placa = '';

  final _filtros = ['Abertas', 'Fechadas', 'Todas'];

  List<OrdemModel> _ordens = [];

  bool isLoading = false;

  @override
  void initState() {
    //placa = widget.placa;

    super.initState();
    //initializeDateFormatting('pt_BR', DateFormat.DAY);

    getOrdens();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.placa),
            Text(' - Ordens de Serviços'),            
          ],
        ),
        //title: const Text('Ordens de Serviços'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 250, 250, 251),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        toolbarTextStyle: const TextStyle(color: Colors.white),
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Column(
              children: [
                _buildFiltros(context),
                _buildOrdens(context),
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

  Widget _buildOrdens(context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 200),
      width: MediaQuery.of(context).size.width,
      //color: Colors.black,
      child: ListView.builder(
        itemCount: _ordens.length,
        itemBuilder: (context, index) {
          final OrdemModel ordem = _ordens[index];
          return OrdemCard(
            numeroOrdem: ordem.numeroOrdem,
            dataEntrada: ordem.dataEntrada,
            dataProgramada: ordem.dataProgramada,
            // placa: ordem.placa,
            //marca: ordem.marca,
            //nome: ordem.nome,
            observacao: ordem.observacao,
            //stars: ordem.stars,
            //comment: ordem.comment,
          );
        },
      ),
    );
  }

  void getOrdens() async {
    setState(() => isLoading = true);

    final ordens = await OrdemRepository().getOrdens();

    setState(() {
      _ordens.addAll(ordens);
    });

    setState(() => isLoading = false);
  }
}
