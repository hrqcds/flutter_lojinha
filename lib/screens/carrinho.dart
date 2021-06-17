import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/widgets/appbar_customizada.dart';
import 'package:lojinha_alura/widgets/lista_carrinho.dart';

import '../main.dart';

class Carrinho extends StatefulWidget {
  final formatacaoReais = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    int? valorTotal = _calcularTotal();

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              widget.formatacaoReais.format(valorTotal),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(
        titulo: "Carrinho",
        paginaCarrinho: true,
      ),
      body: _contruirTela(),
    );
  }

  void _atualiza() {
    setState(() {});
  }

  int? _calcularTotal() {
    if (Inicio.itensCarrinho.isNotEmpty) {
      return Inicio.itensCarrinho
          .map((item) => item.movel!.preco! * item.quantidade!)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);
    }
    return 0;
  }

  Widget _contruirTela() {
    if (Inicio.itensCarrinho.isNotEmpty) {
      return ListaCarrinho(atualiza: _atualiza);
    } else {
      return Center(child: Text("Nenhum item no carrinho"));
    }
  }
}
