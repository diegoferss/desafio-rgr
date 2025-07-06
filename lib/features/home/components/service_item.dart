import 'package:flutter/material.dart';

import '../../../support/enums/services.dart';
import '../../../support/styles/app_colors.dart';
import '../../../support/styles/app_fonts.dart';

class ServiceItem extends StatelessWidget {
  final Services service;
  final VoidCallback onTap;

  const ServiceItem({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: BoxDecoration(color: AppColors.black03, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(service.icon, color: AppColors.green),
              SizedBox(height: 8),
              Text(service.title, style: AppFonts.nunito(fontSize: 14, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
