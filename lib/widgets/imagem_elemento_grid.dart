import 'package:flutter/material.dart';

class ImagemElementoGrid extends StatelessWidget {
  final String? imagem;

  ImagemElementoGrid({this.imagem});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image(
        image: AssetImage("utilidades/assets/imagens/$imagem"),
        fit: BoxFit.cover,
      ),
    );
  }
}
