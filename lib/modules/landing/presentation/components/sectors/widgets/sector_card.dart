import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/extensions/responsive_extension.dart';
import '../../../../domain/entities/content_item.dart';

class SectorCard extends StatefulWidget {
  final SectorItem sector;
  final bool isSelected;
  final VoidCallback? onTap;

  const SectorCard({
    super.key, 
    required this.sector,
    this.isSelected = false,
    this.onTap,
  });

  @override
  State<SectorCard> createState() => _SectorCardState();
}

class _SectorCardState extends State<SectorCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool active = _isHovered || widget.isSelected;

    return VisibilityDetector(
      key: Key('sector-${widget.sector.title}'),
      onVisibilityChanged: (info) {
        if (!mounted) return;
        // Only auto-trigger hover on mobile/tablet based on visibility
        if (!context.isDesktop) {
          if (info.visibleFraction > 0.8) {
            setState(() => _isHovered = true);
          } else if (info.visibleFraction < 0.2) {
            setState(() => _isHovered = false);
          }
        }
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          onTapDown: (_) => setState(() => _isHovered = true),
          onTapUp: (_) => setState(() => _isHovered = false),
          onTapCancel: () => setState(() => _isHovered = false),
          child: AnimatedScale(
            scale: active ? 1.05 : 1.0,
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
                  if (active)
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
                    Colors.black.withAlpha(active ? 20 : 50), 
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
                      AppColors.secondary.withAlpha(active ? 200 : 230),
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
                        fontSize: active ? 22 : 20,
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
      ),
    );
  }
}
