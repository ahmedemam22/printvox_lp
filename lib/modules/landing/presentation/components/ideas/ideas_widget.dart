import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/localization_extension.dart';
import '../../../../../core/extensions/responsive_extension.dart';
import '../../../../../core/constants/assets.dart';
import 'widgets/stat_item.dart';
import 'widgets/ideas_divider.dart';

class IdeasWidget extends StatelessWidget {
  final VoidCallback? onExploreTap;

  const IdeasWidget({super.key, this.onExploreTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          Flex(
            direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// 🧾 TEXT SECTION
              Expanded(
                flex: context.isDesktop ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: context.isDesktop ? 64 : 40,
                          height: 1.1,
                          fontFamily: 'Outfit',
                        ),
                        children: [
                          TextSpan(text: context.l10n.ideasTitle1),

                          /// GRADIENT WORD
                          WidgetSpan(
                            child: ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  AppColors.gradientStart,
                                  AppColors.gradientMedium,
                                  AppColors.gradientEnd,
                                ],
                              ).createShader(bounds),
                              child: Text(
                                context.l10n.ideasTitle2,
                                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: context.isDesktop ? 64 : 40,
                                  height: 1.1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// SUBTITLE
                    Text(
                      context.l10n.ideasSubtitle,
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 48),

                    /// CTA BUTTON
                    ElevatedButton(
                      onPressed: onExploreTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.l10n.btnExploreServices.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              if (context.isDesktop) const SizedBox(width: 40),

              /// 🖼 MOCKUP SECTION
              Expanded(
                flex: context.isDesktop ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    AppAssets.imagesHeaderMockup,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          /// 📊 STATS
          Flex(
            direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatItem(value: '20', label: context.l10n.statYears),

              if (context.isDesktop) const IdeasDivider(),
              if (!context.isDesktop) const SizedBox(height: 24),

              StatItem(value: '48س', label: context.l10n.statTime),

              if (context.isDesktop) const IdeasDivider(),
              if (!context.isDesktop) const SizedBox(height: 24),

              StatItem(value: '2M+', label: context.l10n.statPrinted),

              if (context.isDesktop) const IdeasDivider(),
              if (!context.isDesktop) const SizedBox(height: 24),

              StatItem(value: '850+', label: context.l10n.statClients),
            ],
          ),
        ],
      ),
    );
  }
}