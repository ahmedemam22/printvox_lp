import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/localization_extension.dart';
import '../../../../../core/extensions/responsive_extension.dart';
import 'widgets/feature_item.dart';

class WhyUsWidget extends StatefulWidget {
  const WhyUsWidget({super.key});

  @override
  State<WhyUsWidget> createState() => _WhyUsWidgetState();
}

class _WhyUsWidgetState extends State<WhyUsWidget> {
  bool _startAnimation = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('why-us-visibility-key'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          if (!_startAnimation) {
            setState(() {
              _startAnimation = true;
            });
          }
        } else if (info.visibleFraction == 0) {
          // Reset when completely out of view
          if (_startAnimation) {
            setState(() {
              _startAnimation = false;
            });
          }
        }
      },
      child: Container(
        color: AppColors.secondary,
        child: Flex(
          direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
          children: [
            /// 📸 IMAGE SIDE
            Expanded(
              flex: context.isDesktop ? 1 : 0,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.imagesClientTrust),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: context.isDesktop
                      ? const BorderRadius.horizontal(left: Radius.circular(32))
                      : const BorderRadius.vertical(top: Radius.circular(32)),
                ),
              ),
            ),

            /// 📝 CONTENT SIDE
            Expanded(
              flex: context.isDesktop ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.all(context.isDesktop ? 80.0 : 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Why Choose Us',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.whyUsTitle,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      context.l10n.whyUsSubtitle,
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 48),

                    /// 🌪 STAGGERED LIST
                    if (_startAnimation)
                      AnimationLimiter(
                        key: UniqueKey(), // Forces reset
                        child: Column(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 1500),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              FeatureItem(
                                icon: Icons.bolt,
                                title: context.l10n.whyUsFastTitle,
                                description: context.l10n.whyUsFastDesc,
                                color: AppColors.primary,
                              ),
                              const SizedBox(height: 16),
                              FeatureItem(
                                icon: Icons.verified_user_outlined,
                                title: context.l10n.whyUsQualityTitle,
                                description: context.l10n.whyUsQualityDesc,
                                color: Colors.cyan,
                              ),
                              const SizedBox(height: 16),
                              FeatureItem(
                                icon: Icons.design_services,
                                title: context.l10n.whyUsDesignTitle,
                                description: context.l10n.whyUsDesignDesc,
                                color: AppColors.primary,
                              ),
                              const SizedBox(height: 16),
                              FeatureItem(
                                icon: Icons.local_shipping_outlined,
                                title: context.l10n.whyUsDeliveryTitle,
                                description: context.l10n.whyUsDeliveryDesc,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      const SizedBox(height: 300), // Placeholder to maintain height
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
