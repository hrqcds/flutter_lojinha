import 'package:flutter/material.dart';
import 'package:lojinha_alura/models/model.dart';
import 'package:lojinha_alura/screens/detalhes.dart';
import 'package:lojinha_alura/widgets/degrade_elemento_grid.dart';
import 'package:lojinha_alura/widgets/imagem_elemento_grid.dart';
import 'package:lojinha_alura/widgets/titulo_elemento_grid.dart';

class ElementoGridProdutos extends StatefulWidget {
  final Movel? movel;
  final Function? atualiza;

  ElementoGridProdutos({this.movel, this.atualiza});

  @override
  _ElementoGridProdutosState createState() => _ElementoGridProdutosState();
}

class _ElementoGridProdutosState extends State<ElementoGridProdutos> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Detalhes(
              movel: widget.movel,
            );
          }),
        ).then((value) => widget.atualiza);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ImagemElementoGrid(
                imagem: widget.movel!.foto,
              ),
              DegradeElementoGrid(),
              TituloElementoGrid(titulo: widget.movel!.titulo),
            ],
          ),
        ),
      ),
    );
  }
}
