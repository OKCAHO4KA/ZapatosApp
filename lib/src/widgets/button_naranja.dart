import 'package:flutter/material.dart';

class ButtonNaranja extends StatelessWidget {
  final String text;
  final double? alto;
  final Color? color;
  final double ancho;
  const ButtonNaranja(
      {super.key,
      required this.text,
      this.alto = 50,
      this.ancho = 170,
      this.color = const Color(0xfff0a23a)});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
      ),
      height: alto,
      width: ancho,
      child: Text(text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
