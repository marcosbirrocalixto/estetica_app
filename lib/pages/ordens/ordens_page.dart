import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/custom_circular_progress_indicator.dart';

import '../../widgets/filtros.dart';
import '../../models/ordem_model.dart';
import 'widgets/OrdemCard.dart';
import '../../data/repositories/ordem_repository.dart';
import '../../stores/filtros_store.dart';
import '../../widgets/botoom_navigator.dart';

class OrdemPage extends StatefulWidget {
  final String placa;
  const OrdemPage({super.key, required this.placa});

  @override
  State<OrdemPage> createState() => _OrdemPageState();
}

class _OrdemPageState extends State<OrdemPage> {
  late dynamic placa = '';

  List<OrdemModel> _ordens = [];
  FiltrosStore storeFiltros = FiltrosStore();

  bool isLoading = false;

  @override
  void initState() {
    placa = widget.placa;

    super.initState();
    //initializeDateFormatting('pt_BR', DateFormat.DAY);

    storeFiltros.getFiltros();
    getOrdens(placa.toString());
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
          ? CustomCircularProgressIndicator(
              width: 50,
              height: 50,
              textLabel: 'Carregando as Ordens de serviços...',
            )
          : Column(
              children: [
                Observer(
                  builder: (context) {
                    return storeFiltros.isLoading
                        ? CustomCircularProgressIndicator(
                            width: 50,
                            height: 50,
                            textLabel: 'Carregando os filtros...',
                          )
                        : FiltrosWidget(storeFiltros.filtros);
                  },
                ),
                _buildOrdens(context),
              ],
            ),
      bottomNavigationBar: BotoomNavigator(1),
    );
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
            ordem: ordem,
            
          );
          
        },
      ),
    );
  }

  void getOrdens(placa) async {
    setState(() => isLoading = true);
    print("vai entrar getordens $placa");

    final ordens = await OrdemRepository().getOrdens(placa);

    setState(() {
      _ordens.addAll(ordens);
    });
    print("saiu getordens $placa");
    setState(() => isLoading = false);
  }
}
