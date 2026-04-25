import 'package:flutter/material.dart';

class LandingBackground extends StatelessWidget {
  const LandingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          /// BASE DARK
          Container(
            color: const Color(0xFF0B0F2A),
          ),

          /// MAIN GRADIENT
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0B0F2A),
                  Color(0xFF1B263B),
                  Color(0xFF0D1B2A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// 🔥 PURPLE GLOW (RIGHT TOP)
          Positioned(
            right: -150,
            top: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFB5179E).withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// 🔵 BLUE GLOW (LEFT BOTTOM)
          Positioned(
            left: -150,
            bottom: -120,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF4361EE).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
