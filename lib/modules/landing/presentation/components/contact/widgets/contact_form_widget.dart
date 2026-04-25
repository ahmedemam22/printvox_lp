import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/extensions/localization_extension.dart';
import 'custom_text_field.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.heroGetQuote,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'سيقوم فريقنا بالتواصل معك في أقرب وقت.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: context.l10n.heroFullName,
                  hint: 'محمد العبدالله',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: context.l10n.heroPhone,
                  hint: '05xxxxxxxx',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: context.l10n.heroOrderDetails,
            hint: 'مثلا: محتاج 500 علبة ديليفري بمقاس...',
            maxLines: 4,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                context.l10n.heroSendOrder,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
