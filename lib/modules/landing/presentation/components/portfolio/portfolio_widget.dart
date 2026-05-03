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
  final ScrollController _tabScrollController = ScrollController();
  String _selectedCategory = 'Packaging';

  final Map<String, GlobalKey> _tabKeys = {
    'Packaging': GlobalKey(),
    'Branding': GlobalKey(),
    'Print': GlobalKey(),
    'Large Format': GlobalKey(),
  };

  @override
  void dispose() {
    _tabScrollController.dispose();
    super.dispose();
  }

  void _onTabSelected(String category) {
    setState(() => _selectedCategory = category);

    // Animate to center the selected tab only on mobile/tablet
    if (!context.isDesktop) {
      final key = _tabKeys[category];
      if (key != null && key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 500),
          alignment: 0.5, // Center the tab
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter logic
    final filteredItems = widget.items.where((item) => item.category == _selectedCategory).toList();

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
            controller: _tabScrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(
                  key: _tabKeys['Packaging'],
                  title: context.l10n.tabPackaging, 
                  isSelected: _selectedCategory == 'Packaging',
                  onTap: () => _onTabSelected('Packaging'),
                ),
                TabButton(
                  key: _tabKeys['Branding'],
                  title: context.l10n.tabBranding, 
                  isSelected: _selectedCategory == 'Branding',
                  onTap: () => _onTabSelected('Branding'),
                ),
                TabButton(
                  key: _tabKeys['Print'],
                  title: context.l10n.tabPrint, 
                  isSelected: _selectedCategory == 'Print',
                  onTap: () => _onTabSelected('Print'),
                ),
                TabButton(
                  key: _tabKeys['Large Format'],
                  title: context.l10n.tabLargeFormat, 
                  isSelected: _selectedCategory == 'Large Format',
                  onTap: () => _onTabSelected('Large Format'),
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
