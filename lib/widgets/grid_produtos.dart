import 'package:flutter/material.dart';
import 'package:lojinha_alura/models/model.dart';
import 'package:lojinha_alura/widgets/elemento_grid_produtos.dart';

class GridProdutos extends StatelessWidget {
  final moveis;
  final Function? atualiza;

  GridProdutos({this.atualiza, this.moveis});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: moveis.length,
        itemBuilder: (context, index) {
          final movel = Movel.fromJson(moveis[index]);
          return ElementoGridProdutos(
            movel: movel,
            atualiza: atualiza,
          );
        });
  }
}
