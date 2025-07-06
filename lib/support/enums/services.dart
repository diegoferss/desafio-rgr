import 'package:flutter/material.dart';

enum Services {
  automobile(Icons.card_giftcard),
  health(Icons.health_and_safety),
  home(Icons.home),
  life(Icons.person),
  travel(Icons.card_giftcard),
  pet(Icons.pets),
  disability(Icons.accessibility),
  funeral(Icons.card_giftcard);

  final IconData icon;

  const Services(this.icon);

  String get title {
    return switch (this) {
      automobile => 'Automóvel',
      health => 'Saúde',
      home => 'Casa',
      life => 'Vida',
      travel => 'Viagem',
      pet => 'Pet',
      disability => 'Invalidez',
      funeral => 'Funeral',
    };
  }
}
