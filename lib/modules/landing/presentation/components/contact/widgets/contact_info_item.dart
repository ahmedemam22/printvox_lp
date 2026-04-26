import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isPhone;

  final VoidCallback? onTap;

  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isPhone = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            isPhone
                ? Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  )
                : Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
          ],
        ),
      ],
    ),
    );
  }
}
