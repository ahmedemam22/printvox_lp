import 'package:flutter/material.dart';

class FooterLink extends StatelessWidget {
  final String title;

  const FooterLink({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
