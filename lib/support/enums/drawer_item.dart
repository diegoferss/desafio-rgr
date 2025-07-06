enum DrawerItem {
  home,
  contracts,
  claims,
  family,
  assets,
  payments,
  coverages,
  validate_boleto,
  important_numbers,
  settings;

  String get title {
    return switch (this) {
      home => 'Home / Seguros',
      contracts => 'Minhas Contratações',
      claims => 'Meus Sinistros',
      family => 'Minha Família',
      assets => 'Meus Bens',
      payments => 'Pagamentos',
      coverages => 'Coberturas',
      validate_boleto => 'Validar Boleto',
      important_numbers => 'Telefones Importantes',
      settings => 'Configurações',
    };
  }
}
