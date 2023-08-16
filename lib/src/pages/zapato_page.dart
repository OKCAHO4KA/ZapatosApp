import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return const Scaffold(
        body: Column(children: [
      CustomAppBar(
        text: 'For You',
      ),
      Expanded(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Hero(tag: 'zapato-1', child: ZapatoSizePreview()),
            DescriptionZapato(
              titulo: 'Nike Air Max 720',
              description:
                  "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
            ),
          ],
        ),
      )),
      AgregarCarritoBotton(monto: 180.0)
    ]));
  }
}
