import 'package:flutter/material.dart';

import '../../../support/styles/app_colors.dart';
import '../../../support/styles/app_fonts.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AuthButton({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Column(
          children: [
            Text(text, style: AppFonts.nunito(fontSize: 21, fontColor: isSelected ? AppColors.green : AppColors.white)),
            Visibility(
              visible: isSelected,
              child: Container(height: 1.5, color: isSelected ? AppColors.green : AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
