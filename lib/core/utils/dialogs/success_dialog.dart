import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String content;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Text(
        content,
        style: const TextStyle(color: Colors.white70),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('موافق', style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
