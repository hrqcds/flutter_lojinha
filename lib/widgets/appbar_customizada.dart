import 'package:flutter/material.dart';

import 'botao_carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {
  final String? titulo;
  final bool? paginaCarrinho;

  const AppBarCustomizada({this.titulo, this.paginaCarrinho});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "$titulo",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        paginaCarrinho != true ? BotaoCarrinho() : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
