import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_information_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool? fullScreen;
  const ZapatoSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen!) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ZapatoInformationPage();
            },
          ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullScreen! ? 5 : (30.0),
            vertical: fullScreen! ? 5 : 0),
        child: Container(
            width: double.infinity,
            height: 380,
            decoration: BoxDecoration(
                borderRadius: !fullScreen!
                    ? BorderRadius.circular(50)
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                color: const Color(0xffFFD54F)),
            child: Column(
              children: [
                //Zapato con sombra
                const _Zapato(),
                //Tallas
                if (!fullScreen!) _CuadroDeTallas(),
              ],
            )),
      ),
    );
  }
}

class _CuadroDeTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TallaZapatoCaja(numeroTalla: 7),
          TallaZapatoCaja(numeroTalla: 7.5),
          TallaZapatoCaja(numeroTalla: 8),
          TallaZapatoCaja(numeroTalla: 8.5),
          TallaZapatoCaja(numeroTalla: 9),
          TallaZapatoCaja(numeroTalla: 9.5),
        ],
      ),
    );
  }
}

class TallaZapatoCaja extends StatelessWidget {
  final double? numeroTalla;
  const TallaZapatoCaja({
    super.key,
    this.numeroTalla,
  });

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoProvider.talla = numeroTalla!;
      },
      child: Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: numeroTalla == zapatoProvider.talla
                ? const Color(0xffFF9F00)
                : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              if (numeroTalla == zapatoProvider.talla)
                const BoxShadow(
                    color: Color(0xfff0a23a),
                    blurRadius: 20,
                    spreadRadius: 10,
                    offset: Offset(4, 10))
            ],
          ),
          child: Text(numeroTalla.toString().replaceAll('.0', ''),
              style: TextStyle(
                  color: numeroTalla != zapatoProvider.talla
                      ? const Color(0xffFF9F00)
                      : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))),
    );
  }
}

class _Zapato extends StatelessWidget {
  const _Zapato();

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 20,
        left: 50,
        right: 50,
      ),
      child: Stack(
        children: [
          const Positioned(bottom: 00, right: 0, child: _SombraZapatos()),
          Image(image: AssetImage(zapatoProvider.assetImage))
        ],
      ),
    );
  }
}

class _SombraZapatos extends StatelessWidget {
  const _SombraZapatos();
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 218, 134, 37), blurRadius: 35),
            ]),
      ),
    );
  }
}

// class SeleccionarTalla with ChangeNotifier {}
