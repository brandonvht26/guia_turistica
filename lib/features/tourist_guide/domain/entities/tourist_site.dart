class TouristSite {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String location;
  final bool isFavorite;

  const TouristSite({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
    this.isFavorite = false,
  });

  TouristSite copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? location,
    bool? isFavorite,
  }) {
    return TouristSite(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TouristSite &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
