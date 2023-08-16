import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class AgregarCarritoBotton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBotton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 235, 235),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(monto.toString().replaceAll('.0', ''),
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text('00€',
                style: TextStyle(
                  height: 0.2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            const Spacer(),
            const ButtonNaranja(
              text: 'Add to cart',
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
