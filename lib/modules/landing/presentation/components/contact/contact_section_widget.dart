import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/localization_extension.dart';
import '../../../../../core/extensions/responsive_extension.dart';
import 'widgets/contact_form_widget.dart';
import 'widgets/contact_info_item.dart';

class ContactSectionWidget extends StatelessWidget {
  const ContactSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: AppColors.secondary,
      child: Flex(
        direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: context.isDesktop ? 1 : 0,
            child: const ContactFormWidget(),
          ),
          if (context.isDesktop) const SizedBox(width: 80),
          if (!context.isDesktop) const SizedBox(height: 40),
          Expanded(
            flex: context.isDesktop ? 1 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.heroTitle,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.heroSubtitle,
                  style: const TextStyle(
                    color: AppColors.textBody,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                ContactInfoItem(
                  icon: Icons.location_on,
                  title: context.l10n.lblLocation,
                  subtitle: context.l10n.valLocation,
                ),
                const SizedBox(height: 20),
                ContactInfoItem(
                  icon: Icons.phone,
                  title: context.l10n.lblPhone,
                  subtitle: context.l10n.valPhone,
                  isPhone: true,
                  onTap: () async {
                    final Uri tel = Uri.parse("tel:+201100113901");
                    if (await canLaunchUrl(tel)) {
                      await launchUrl(tel);
                    }
                  },
                ),
                const SizedBox(height: 20),
                ContactInfoItem(
                  icon: Icons.email,
                  title: context.l10n.lblEmail,
                  subtitle: context.l10n.valEmail,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () async {
                    final Uri whatsapp = Uri.parse("https://wa.me/201100113901");
                    if (await canLaunchUrl(whatsapp)) {
                      await launchUrl(whatsapp, mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: SvgPicture.asset(
                    AppAssets.iconsWhatsapp,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 20,
                  ),
                  label: Text(context.l10n.btnWhatsapp),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whatsappGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
