import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_fonts.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.black02,
      title: Text('EMPRESA', style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.w600)),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.notifications, color: AppColors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
