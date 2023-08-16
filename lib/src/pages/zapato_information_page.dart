import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ZapatoInformationPage extends StatelessWidget {
  const ZapatoInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            const Hero(
                tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white60,
                    size: 60,
                  ),
                ))
          ]),
          const Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              DescriptionZapato(
                titulo: 'Nike Air Max 720',
                description:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _MontoBuyNow(),
              _ColoresAlElegir(),
              _ButtonesLikeCartSett()
            ],
          )))
        ],
      ),
    );
  }
}

class _ButtonesLikeCartSett extends StatelessWidget {
  const _ButtonesLikeCartSett();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ButtonRedondo(Icon(Icons.favorite, color: Colors.red, size: 30)),
          _ButtonRedondo(
              Icon(Icons.shopping_cart, color: Colors.black12, size: 30)),
          _ButtonRedondo(Icon(Icons.settings, color: Colors.black12, size: 30)),
        ],
      ),
    );
  }
}

class _ButtonRedondo extends StatelessWidget {
  final Icon? icon;

  const _ButtonRedondo(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, 7))
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 30),
        width: 60,
        height: 60,
        child: icon);
  }
}

class _ColoresAlElegir extends StatelessWidget {
  const _ColoresAlElegir();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 90,
                  child: _BottonColor(
                      color: Color(0xffCCDA3E),
                      index: 4,
                      url: 'assets/verde.png')),
              Positioned(
                left: 60,
                child: _BottonColor(
                    color: Color(0xffFFAE00),
                    index: 3,
                    url: 'assets/amarillo.png'),
              ),
              Positioned(
                  left: 30,
                  child: _BottonColor(
                      color: Color(0xff45A1FB),
                      index: 2,
                      url: 'assets/azul.png')),
              _BottonColor(
                  color: Color(0xff445660), index: 1, url: 'assets/negro.png'),
            ],
          )),
          // Spacer(),
          ButtonNaranja(
            text: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFCE78),
          )
        ],
      ),
    );
  }
}

class _BottonColor extends StatelessWidget {
  final Color color;
  final int? index;
  final String url;
  const _BottonColor({required this.color, this.index, required this.url});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index! * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final pro = Provider.of<ZapatoModel>(context, listen: false);

          pro.assetImage = url;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            const Text('180.0€',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const ButtonNaranja(
                text: 'Buy now',
                ancho: 120,
                alto: 55,
              ),
            )
          ],
        ),
      ),
    );
  }
}
