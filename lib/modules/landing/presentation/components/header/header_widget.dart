import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/localization_extension.dart';
import '../../../../../core/extensions/responsive_extension.dart';
import '../../../../../core/constants/assets.dart';
import 'widgets/header_link.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback onCategoriesTap;
  final VoidCallback onServicesTap;
  final VoidCallback onPortfolioTap;
  final VoidCallback onWhyUsTap;
  final VoidCallback onContactTap;
  final String activeSection;

  const HeaderWidget({
    super.key,
    required this.onCategoriesTap,
    required this.onServicesTap,
    required this.onPortfolioTap,
    required this.onWhyUsTap,
    required this.onContactTap,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.secondary.withAlpha(240), // Adjusted to valid alpha
        border: const Border(bottom: BorderSide(color: Colors.white10, width: 0.5)),
      ),
      child: Row(
        children: [
          // Action Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              context.l10n.btnOrderNow.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          const Spacer(),


          // Navigation Links
          if (context.isDesktop)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderLink(
                  title: context.l10n.navServices,
                  onTap: onServicesTap,
                  isSelected: activeSection == 'services',
                ),
                HeaderLink(
                  title: context.l10n.navCategories,
                  onTap: onCategoriesTap,
                  isSelected: activeSection == 'categories',
                ),
                HeaderLink(
                  title: context.l10n.navPortfolio,
                  onTap: onPortfolioTap,
                  isSelected: activeSection == 'portfolio',
                ),
                HeaderLink(
                  title: context.l10n.navWhyUs,
                  onTap: onWhyUsTap,
                  isSelected: activeSection == 'whyUs',
                ),
                HeaderLink(
                  title: context.l10n.navContact,
                  onTap: onContactTap,
                  isSelected: activeSection == 'contact',
                ),
              ],
            ),

          const Spacer(),


          // Logo Section (User's preferred layout)
          Row(
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                  children: [
                    WidgetSpan(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.gradientMedium, AppColors.gradientStart],
                        ).createShader(bounds),
                        child: const Text(
                          'VOX',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(
                      text: 'PRINT',
                      style: TextStyle(color: Colors.white),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  AppAssets.iconsLogoChar,
                  height: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
