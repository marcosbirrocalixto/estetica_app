import 'package:flutter/material.dart';

import '../../models/filtro_model.dart';

class FiltrosWidget extends StatelessWidget {
  List<FiltroModel> _filtros = [];

  FiltrosWidget(this._filtros);

  @override
  Widget build(BuildContext context) {
    return _buildFiltros();
  }

  Widget _buildFiltros() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filtros.length,
        itemBuilder: (context, index) {
          final FiltroModel filtro = _filtros[index];
          return _buildFiltro(filtro);
        },
      ),
    );
  }

  Widget _buildFiltro(FiltroModel filtro) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top:2, bottom: 2, left: 10, right: 10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: filtro.description == 'Todos' ? Colors.black :  Colors.grey)),
        child: Center(
          child: Text(
            filtro.description,
            style: TextStyle(color: filtro.description == 'Todos' ? Colors.red : Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
