import 'package:flutter/material.dart';

import '../../../support/styles/app_colors.dart';
import '../../../support/styles/app_fonts.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const HomeSection({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: BoxDecoration(color: AppColors.black03, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Icon(icon, color: AppColors.white, size: 40),
                  ),
                  SizedBox(height: 24),
                  Text(
                    description,
                    style: AppFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
