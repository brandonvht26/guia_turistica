import '../models/tourist_site_model.dart';

class TouristSiteLocalDataSource {
  final List<TouristSiteModel> _sites = [
    const TouristSiteModel(
      id: '1',
      name: 'Mitad del Mundo',
      description:
          'Monumento emblemático que marca la latitud 0°0\'0". Aquí puedes '
          'pararte con un pie en cada hemisferio. Cuenta con un museo '
          'etnográfico interactivo, planetario y pabellones culturales.',
      imageUrl: 'https://picsum.photos/seed/mitad-del-mundo/800/400',
      location: 'San Antonio de Pichincha, Quito',
    ),
    const TouristSiteModel(
      id: '2',
      name: 'Islas Galápagos',
      description:
          'Archipiélago volcánico declarado Patrimonio Natural de la Humanidad '
          'con especies únicas como las tortugas gigantes, iguanas marinas y '
          'piqueros de patas azules.',
      imageUrl: 'https://picsum.photos/seed/galapagos/800/400',
      location: 'Provincia de Galápagos',
    ),
    const TouristSiteModel(
      id: '3',
      name: 'Centro Histórico de Quito',
      description:
          'Uno de los centros históricos mejor conservados de Latinoamérica. '
          'Sus calles empedradas albergan iglesias coloniales como La Compañía, '
          'San Francisco y la Plaza Grande.',
      imageUrl: 'https://picsum.photos/seed/centro-historico-quito/800/400',
      location: 'Quito, Pichincha',
    ),
    const TouristSiteModel(
      id: '4',
      name: 'Parque Nacional Cotopaxi',
      description:
          'Hogar del volcán activo más alto del mundo (5897 msnm). Ofrece '
          'senderismo, ciclismo de montaña y avistamiento de cóndores andinos '
          'en un entorno de páramo impresionante.',
      imageUrl: 'https://picsum.photos/seed/cotopaxi/800/400',
      location: 'Provincia de Cotopaxi',
    ),
    const TouristSiteModel(
      id: '5',
      name: 'Baños de Agua Santa',
      description:
          'Ciudad de aventura y relax famosa por sus aguas termales, la Ruta '
          'de las Cascadas, puentismo desde el puente de San Francisco y '
          'la Casa del Árbol.',
      imageUrl: 'https://picsum.photos/seed/banios/800/400',
      location: 'Provincia de Tungurahua',
    ),
    const TouristSiteModel(
      id: '6',
      name: 'Cuenca Centro Histórico',
      description:
          'Ciudad colonial con arquitectura republicana y calles adoquinadas. '
          'Su Catedral de la Inmaculada Concepción y el río Tomebamba ofrecen '
          'estampas inolvidables.',
      imageUrl: 'https://picsum.photos/seed/cuenca/800/400',
      location: 'Cuenca, Azuay',
    ),
    const TouristSiteModel(
      id: '7',
      name: 'Ingapirca',
      description:
          'El complejo arqueológico inca más importante del Ecuador. Destaca '
          'el Templo del Sol, una estructura elíptica construida con bloques '
          'de piedra perfectamente ensamblados.',
      imageUrl: 'https://picsum.photos/seed/ingapirca/800/400',
      location: 'Provincia de Cañar',
    ),
    const TouristSiteModel(
      id: '8',
      name: 'Laguna de Quilotoa',
      description:
          'Cráter volcánico con una laguna de color turquesa intenso a 3914 '
          'msnm. Se puede descender hasta la orilla en kayak o recorrer el borde '
          'del cráter con vistas espectaculares.',
      imageUrl: 'https://picsum.photos/seed/quilotoa/800/400',
      location: 'Provincia de Cotopaxi',
    ),
    const TouristSiteModel(
      id: '9',
      name: 'Malecón 2000 de Guayaquil',
      description:
          'Moderno malecón junto al río Guayas con jardines, museos, el Palacio '
          'de Cristal, el MAAC y el emblemático barrio de Las Peñas con sus 444 '
          'escalones.',
      imageUrl: 'https://picsum.photos/seed/malecon-guayaquil/800/400',
      location: 'Guayaquil, Guayas',
    ),
    const TouristSiteModel(
      id: '10',
      name: 'Teleférico de Quito',
      description:
          'Uno de los teleféricos más altos del mundo. Asciende hasta los 4100 '
          'msnm en el volcán Pichincha ofreciendo vistas panorámicas de toda la '
          'ciudad y los Andes.',
      imageUrl: 'https://picsum.photos/seed/teleferico-quito/800/400',
      location: 'Quito, Pichincha',
    ),
  ];

  Future<List<TouristSiteModel>> getTouristSites() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _sites.map((site) => site.copyWith()).toList();
  }

  Future<void> toggleFavorite(String siteId) async {
    final index = _sites.indexWhere((site) => site.id == siteId);
    if (index != -1) {
      final site = _sites[index];
      _sites[index] = site.copyWithIsFavorite(!site.isFavorite);
    }
  }
}
