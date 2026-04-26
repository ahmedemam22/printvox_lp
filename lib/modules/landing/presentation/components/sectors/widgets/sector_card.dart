import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../domain/entities/content_item.dart';

class SectorCard extends StatefulWidget {
  final SectorItem sector;

  const SectorCard({super.key, required this.sector});

  @override
  State<SectorCard> createState() => _SectorCardState();
}

class _SectorCardState extends State<SectorCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isHovered = true),
        onTapUp: (_) => setState(() => _isHovered = false),
        onTapCancel: () => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 320,
            margin: const EdgeInsets.only(right: 24, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: AppColors.primary.withAlpha(50),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
              ],
              image: DecorationImage(
                image: widget.sector.imageUrl.startsWith('assets') 
                  ? AssetImage(widget.sector.imageUrl) as ImageProvider
                  : NetworkImage(widget.sector.imageUrl),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(_isHovered ? 20 : 50), 
                  BlendMode.darken,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.secondary.withAlpha(_isHovered ? 200 : 230),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: _isHovered ? 22 : 20,
                    ),
                    child: Text(widget.sector.subTitle),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.sector.title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
