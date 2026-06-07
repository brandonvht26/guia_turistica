import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tourist_site.dart';

part 'tourist_site_model.freezed.dart';
part 'tourist_site_model.g.dart';

@freezed
abstract class TouristSiteModel with _$TouristSiteModel {
  const factory TouristSiteModel({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required String location,
    @Default(false) bool isFavorite,
  }) = _TouristSiteModel;

  factory TouristSiteModel.fromJson(Map<String, dynamic> json) =>
      _$TouristSiteModelFromJson(json);
}

extension TouristSiteModelX on TouristSiteModel {
  TouristSite toEntity() => TouristSite(
        id: id,
        name: name,
        description: description,
        imageUrl: imageUrl,
        location: location,
        isFavorite: isFavorite,
      );

  TouristSiteModel copyWithIsFavorite(bool value) =>
      copyWith(isFavorite: value);
}
