import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../domain/entities/content_item.dart';
import '../../../../../core/extensions/localization_extension.dart';
import '../../../../../core/extensions/responsive_extension.dart';
import 'widgets/tab_button.dart';
import 'widgets/portfolio_card.dart';

class PortfolioWidget extends StatefulWidget {
  final List<PortfolioItem> items;

  const PortfolioWidget({super.key, required this.items});

  @override
  State<PortfolioWidget> createState() => _PortfolioWidgetState();
}

class _PortfolioWidgetState extends State<PortfolioWidget> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    // Filter logic
    final filteredItems = _selectedCategory == 'All'
        ? widget.items
        : widget.items.where((item) => item.category == _selectedCategory).toList();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: AppColors.secondary,
      child: Column(
        children: [
          Text(
            context.l10n.portfolioTitle,
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
          const SizedBox(height: 40),
          
          /// 🏷 FILTER TABS
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 TabButton(
                  title: context.l10n.tabAll, 
                  isSelected: _selectedCategory == 'All',
                  onTap: () => setState(() => _selectedCategory = 'All'),
                ),
                TabButton(
                  title: context.l10n.tabPackaging, 
                  isSelected: _selectedCategory == 'Packaging',
                  onTap: () => setState(() => _selectedCategory = 'Packaging'),
                ),
                TabButton(
                  title: context.l10n.tabBranding, 
                  isSelected: _selectedCategory == 'Branding',
                  onTap: () => setState(() => _selectedCategory = 'Branding'),
                ),
                TabButton(
                  title: context.l10n.tabPrint, 
                  isSelected: _selectedCategory == 'Print',
                  onTap: () => setState(() => _selectedCategory = 'Print'),
                ),
                TabButton(
                  title: context.l10n.tabLargeFormat, 
                  isSelected: _selectedCategory == 'Large Format',
                  onTap: () => setState(() => _selectedCategory = 'Large Format'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          /// 🖼 GRID
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isDesktop ? 4 : 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
            ),
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return PortfolioCard(
                key: ValueKey(filteredItems[index].id),
                item: filteredItems[index],
              );
            },
          ),
          
          if (filteredItems.isEmpty)
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                "لا يوجد أعمال في هذا القسم حالياً",
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
            ),
        ],
      ),
    );
  }
}
