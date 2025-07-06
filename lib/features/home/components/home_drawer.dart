import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../support/enums/drawer_item.dart';
import '../../../support/styles/app_colors.dart';
import '../../../support/styles/app_fonts.dart';

class HomeDrawer extends StatelessWidget {
  final User user;
  final List<DrawerItem> items;
  final Function(DrawerItem) onItemTap;

  const HomeDrawer({super.key, required this.user, required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black02,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Olá', style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.white,
                          child: Icon(Icons.person, color: AppColors.black),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name?.isNotEmpty ?? false ? user.name ?? '' : user.email,
                              style: AppFonts.nunito(fontSize: 16, fontColor: AppColors.white),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Minha conta',
                              style: AppFonts.nunito(
                                fontSize: 14,
                                fontColor: AppColors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(color: AppColors.black),
                    SizedBox(height: 12),
                    Expanded(
                      child: ListView.separated(
                        itemCount: items.length + 1,
                        itemBuilder: (_, index) {
                          if (index == items.length) {
                            return Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                'Sair',
                                style: AppFonts.nunito(
                                  fontSize: 16,
                                  fontColor: AppColors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          return GestureDetector(
                            onTap: () => onItemTap(items[index]),
                            child: Row(
                              children: [
                                Icon(Icons.settings, color: AppColors.green),
                                SizedBox(width: 20),
                                Text(
                                  items[index].title,
                                  style: AppFonts.nunito(
                                    fontSize: 16,
                                    fontColor: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(height: 12),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColors.green, AppColors.yellow])),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                            child: Icon(Icons.person, color: AppColors.green, size: 44),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Dúvidas?',
                            style: AppFonts.nunito(
                              fontSize: 16,
                              fontColor: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Entre em contato',
                            style: AppFonts.nunito(
                              fontSize: 14,
                              fontColor: AppColors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
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
