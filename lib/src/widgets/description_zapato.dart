import 'package:flutter/material.dart';

class DescriptionZapato extends StatelessWidget {
  final String titulo;
  final String description;

  const DescriptionZapato(
      {super.key, required this.titulo, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(titulo,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 10,
          ),
          Text(description,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
                height: 1.8,
              ))
        ],
      ),
    );
  }
}
