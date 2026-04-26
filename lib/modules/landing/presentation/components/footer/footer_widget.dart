import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';

import '../../../../../core/extensions/localization_extension.dart';
import '../../../../../core/extensions/responsive_extension.dart';
import 'widgets/footer_link.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      color: AppColors.secondaryBackground.withAlpha(20000000),
      child: Flex(
        direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nav 1
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.navCategories, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 24),
              FooterLink(title: context.l10n.catPharma),
              FooterLink(title: context.l10n.catBeach),
              FooterLink(title: context.l10n.catRetail),
            ],
          ),
          
          // Nav 2
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('الشركة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 24),
              FooterLink(title: context.l10n.navServices),
              FooterLink(title: context.l10n.navPortfolio),
              FooterLink(title: context.l10n.navWhyUs),
            ],
          ),
          
          // Contact Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.navContact, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 24),
              Text(context.l10n.valPhone, style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),
              Text(context.l10n.valEmail, style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),
              Text(context.l10n.valLocation, style: const TextStyle(color: Colors.white70)),
            ],
          ),
          
          // Right/Brand Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PrintVox',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'مطبعة مصرية متخصصة في حلول الطباعة والتغليف منذ اكثر من ٢٠ سنة',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white70, height: 1.6),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
