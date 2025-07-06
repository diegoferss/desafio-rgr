import 'package:flutter/material.dart';

enum Services {
  automobile(Icons.card_giftcard),
  home(Icons.home),
  health(Icons.health_and_safety),
  personal_accident(Icons.person);

  final IconData icon;

  const Services(this.icon);

  String get title {
    return switch (this) {
      automobile => 'Automóvel',
      health => 'Saúde',
      home => 'Casa',
      personal_accident => 'Acidente Pessoal',
    };
  }
}
