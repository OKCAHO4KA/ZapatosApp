import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: double.infinity,
          child: Row(
            children: [
              Text(text,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700)),
              const Spacer(),
              const Icon(
                Icons.search,
                size: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}
