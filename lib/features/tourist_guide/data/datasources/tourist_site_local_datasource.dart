import 'package:shared_preferences/shared_preferences.dart';
import '../models/tourist_site_model.dart';

class TouristSiteLocalDataSource {
  static const _favoritesKey = 'favorite_site_ids';
  final SharedPreferences _prefs;

  final List<TouristSiteModel> _sites = [
    const TouristSiteModel(
      id: '1',
      name: 'Mitad del Mundo',
      description:
          'Monumento emblemático que marca la latitud 0°0\'0". Aquí puedes '
          'pararte con un pie en cada hemisferio. Cuenta con un museo '
          'etnográfico interactivo, planetario y pabellones culturales.',
      imageUrl: 'assets/images/mitad_del_mundo.webp',
      location: 'San Antonio de Pichincha, Quito',
    ),
    const TouristSiteModel(
      id: '2',
      name: 'Islas Galápagos',
      description:
          'Archipiélago volcánico declarado Patrimonio Natural de la Humanidad '
          'con especies únicas como las tortugas gigantes, iguanas marinas y '
          'piqueros de patas azules.',
      imageUrl: 'assets/images/islas_galapagos.webp',
      location: 'Provincia de Galápagos',
    ),
    const TouristSiteModel(
      id: '3',
      name: 'Centro Histórico de Quito',
      description:
          'Uno de los centros históricos mejor conservados de Latinoamérica. '
          'Sus calles empedradas albergan iglesias coloniales como La Compañía, '
          'San Francisco y la Plaza Grande.',
      imageUrl: 'assets/images/centro_historico_de_quito.webp',
      location: 'Quito, Pichincha',
    ),
    const TouristSiteModel(
      id: '4',
      name: 'Parque Nacional Cotopaxi',
      description:
          'Hogar del volcán activo más alto del mundo (5897 msnm). Ofrece '
          'senderismo, ciclismo de montaña y avistamiento de cóndores andinos '
          'en un entorno de páramo impresionante.',
      imageUrl: 'assets/images/parque_nacional_cotopaxi.webp',
      location: 'Provincia de Cotopaxi',
    ),
    const TouristSiteModel(
      id: '5',
      name: 'Baños de Agua Santa',
      description:
          'Ciudad de aventura y relax famosa por sus aguas termales, la Ruta '
          'de las Cascadas, puentismo desde el puente de San Francisco y '
          'la Casa del Árbol.',
      imageUrl: 'assets/images/baños_de_agua_santa.webp',
      location: 'Provincia de Tungurahua',
    ),
    const TouristSiteModel(
      id: '6',
      name: 'Centro Histórico de Cuenca',
      description:
          'Mágica ciudad colonial famosa por su arquitectura renacentista, calles '
          'adoquinadas y sus cuatro ríos. Su majestuosa Catedral de la Inmaculada Concepción '
          'y la ribera del río Tomebamba ofrecen estampas inolvidables.',
      imageUrl: 'assets/images/centro_historico_de_cuenca.webp',
      location: 'Cuenca, Azuay',
    ),
    const TouristSiteModel(
      id: '7',
      name: 'Ingapirca',
      description:
          'El complejo arqueológico inca más importante del Ecuador. Destaca '
          'el Templo del Sol, una estructura elíptica construida con bloques '
          'de piedra perfectamente ensamblados.',
      imageUrl: 'assets/images/ingapirca.webp',
      location: 'Provincia de Cañar',
    ),
    const TouristSiteModel(
      id: '8',
      name: 'Laguna de Quilotoa',
      description:
          'Cráter volcánico con una laguna de color turquesa intenso a 3914 '
          'msnm. Se puede descender hasta la orilla en kayak o recorrer el borde '
          'del cráter con vistas espectaculares.',
      imageUrl: 'assets/images/laguna_de_quilotoa.webp',
      location: 'Provincia de Cotopaxi',
    ),
    const TouristSiteModel(
      id: '9',
      name: 'Malecón 2000 de Guayaquil',
      description:
          'Moderno malecón junto al río Guayas con jardines, museos, el Palacio '
          'de Cristal, el MAAC y el emblemático barrio de Las Peñas con sus 444 '
          'escalones.',
      imageUrl: 'assets/images/malecon_2000_de_guayaquil.webp',
      location: 'Guayaquil, Guayas',
    ),
    const TouristSiteModel(
      id: '10',
      name: 'Teleférico de Quito',
      description:
          'Uno de los teleféricos más altos del mundo. Asciende hasta los 4100 '
          'msnm en el volcán Pichincha ofreciendo vistas panorámicas de toda la '
          'ciudad y los Andes.',
      imageUrl: 'assets/images/teleferico_de_quito.webp',
      location: 'Quito, Pichincha',
    ),
  ];

  TouristSiteLocalDataSource({required SharedPreferences prefs})
      : _prefs = prefs {
    _applyPersistedFavorites();
  }

  void _applyPersistedFavorites() {
    final favoriteIds = _prefs.getStringList(_favoritesKey) ?? [];
    for (var i = 0; i < _sites.length; i++) {
      if (favoriteIds.contains(_sites[i].id) && !_sites[i].isFavorite) {
        _sites[i] = _sites[i].copyWith(isFavorite: true);
      }
    }
  }

  Future<List<TouristSiteModel>> getTouristSites() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _sites.map((site) => site.copyWith()).toList();
  }

  Future<void> toggleFavorite(String siteId) async {
    final index = _sites.indexWhere((site) => site.id == siteId);
    if (index == -1) return;

    final site = _sites[index];
    final newIsFavorite = !site.isFavorite;
    _sites[index] = site.copyWithIsFavorite(newIsFavorite);

    final favoriteIds =
        List<String>.from(_prefs.getStringList(_favoritesKey) ?? []);
    if (newIsFavorite) {
      favoriteIds.add(siteId);
    } else {
      favoriteIds.remove(siteId);
    }
    await _prefs.setStringList(_favoritesKey, favoriteIds);
  }
}
