import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../domain/entities/content_item.dart';
import '../../../../../core/extensions/localization_extension.dart';
import 'widgets/sector_card.dart';

class SectorsWidget extends StatelessWidget {
  final List<SectorItem> sectors;

  const SectorsWidget({super.key, required this.sectors});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              scrollDirection: Axis.horizontal,
              itemCount: sectors.length,
              itemBuilder: (context, index) {
                final sector = sectors[index];
                return SectorCard(sector: sector);
              },
            ),
          ),
        ],
      ),
    );
  }
}
