class Country {
  final String icon;
  final String name;
  final String iso;

  Country(this.icon, this.name, this.iso);

  static List<Country> dataCountries = [
    Country('🇺🇸', 'Estados Unidos', 'us'),
    // Country('🇦🇪', 'Emiratos Árabes Unidos', 'ae'),
    Country('🇲🇽', 'México', 'mx'),
    Country('🇦🇷', 'Argentina', 'ar'),
    Country('🇦🇹', 'Austria', 'at'),
    Country('🇦🇺', 'Australia', 'au'),
    Country('🇧🇪', 'Bélgica', 'be'),
  ];
}
