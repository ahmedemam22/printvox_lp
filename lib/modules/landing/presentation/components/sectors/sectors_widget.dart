import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../core/constants/colors.dart';
import '../../../domain/entities/content_item.dart';
import '../../../../../core/extensions/localization_extension.dart';
import 'widgets/sector_card.dart';

class SectorsWidget extends StatefulWidget {
  final List<SectorItem> sectors;

  const SectorsWidget({super.key, required this.sectors});

  @override
  State<SectorsWidget> createState() => _SectorsWidgetState();
}

class _SectorsWidgetState extends State<SectorsWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _startAnimation = false;
  int? _selectedIndex;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (!_scrollController.hasClients) return;

    const double cardWidth = 320.0;
    const double margin = 24.0;
    const double padding = 40.0;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the position of the card's center relative to the start of the list
    final double cardCenterPosition = padding + (index * (cardWidth + margin)) + (cardWidth / 2);

    // The scroll offset that centers the card
    double targetOffset = cardCenterPosition - (screenWidth / 2);

    // Clamp the offset between 0 and max scroll extent
    targetOffset = targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent);

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('sectors-section'),
      onVisibilityChanged: (info) {
        if (!mounted) return;
        if (info.visibleFraction > 0.1 && !_startAnimation) {
          setState(() => _startAnimation = true);
        }
      },
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: AppColors.secondary,
      child: Column(
        children: [
          Text(
            context.l10n.sectCategoriesTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.gradientStart, AppColors.gradientMedium, AppColors.gradientEnd],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 450,
            child: _startAnimation
                ? AnimationLimiter(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.sectors.length,
                      itemBuilder: (context, index) {
                        final sector = widget.sectors[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            horizontalOffset: 100.0,
                            child: FadeInAnimation(
                              child: SectorCard(
                                sector: sector,
                                isSelected: _selectedIndex == index,
                                onTap: () => _scrollToIndex(index),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    ));
  }
}
