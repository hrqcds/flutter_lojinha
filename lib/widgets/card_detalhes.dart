import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/models/item_carrinho.dart';
import 'package:lojinha_alura/models/model.dart';

import '../main.dart';
import 'texto_detalhes.dart';

class CardDetalhes extends StatelessWidget {
  final formatacaoReais = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  final Movel? movel;
  final Function? atualizaPagina;

  CardDetalhes({this.movel, this.atualizaPagina});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextoDetalhes(
            texto: movel!.titulo,
            estilo: Theme.of(context).textTheme.headline1,
          ),
          TextoDetalhes(
            texto: movel!.descricao,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatacaoReais.format(movel!.preco),
                  style: Theme.of(context).textTheme.headline1,
                ),
                ElevatedButton(
                  onPressed: () {
                    _verificarListaCarrinho(Inicio.itensCarrinho,
                        ItemCarrinho(quantidade: 1, movel: movel));
                  },
                  child: Text(
                    "Comprar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _adicionarItemCarrinho(item) {
    Inicio.itensCarrinho.add(item);
    atualizaPagina!();
  }

  void _verificarListaCarrinho(List<ItemCarrinho> lista, ItemCarrinho item) {
    int indexMovel = lista.indexWhere((item) => item.movel == movel);
    if (indexMovel >= 0) {
      lista[indexMovel].quantidade = lista[indexMovel].quantidade! + 1;
    } else {
      _adicionarItemCarrinho(item);
    }
  }
}
