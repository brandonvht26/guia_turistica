// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tourist_site_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TouristSiteModel {

 String get id; String get name; String get description; String get imageUrl; String get location; bool get isFavorite;
/// Create a copy of TouristSiteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TouristSiteModelCopyWith<TouristSiteModel> get copyWith => _$TouristSiteModelCopyWithImpl<TouristSiteModel>(this as TouristSiteModel, _$identity);

  /// Serializes this TouristSiteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TouristSiteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,location,isFavorite);

@override
String toString() {
  return 'TouristSiteModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, location: $location, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $TouristSiteModelCopyWith<$Res>  {
  factory $TouristSiteModelCopyWith(TouristSiteModel value, $Res Function(TouristSiteModel) _then) = _$TouristSiteModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String imageUrl, String location, bool isFavorite
});




}
/// @nodoc
class _$TouristSiteModelCopyWithImpl<$Res>
    implements $TouristSiteModelCopyWith<$Res> {
  _$TouristSiteModelCopyWithImpl(this._self, this._then);

  final TouristSiteModel _self;
  final $Res Function(TouristSiteModel) _then;

/// Create a copy of TouristSiteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? location = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TouristSiteModel].
extension TouristSiteModelPatterns on TouristSiteModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TouristSiteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TouristSiteModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TouristSiteModel value)  $default,){
final _that = this;
switch (_that) {
case _TouristSiteModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TouristSiteModel value)?  $default,){
final _that = this;
switch (_that) {
case _TouristSiteModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String imageUrl,  String location,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TouristSiteModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.location,_that.isFavorite);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String imageUrl,  String location,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _TouristSiteModel():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.location,_that.isFavorite);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String imageUrl,  String location,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _TouristSiteModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.location,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TouristSiteModel implements TouristSiteModel {
  const _TouristSiteModel({required this.id, required this.name, required this.description, required this.imageUrl, required this.location, this.isFavorite = false});
  factory _TouristSiteModel.fromJson(Map<String, dynamic> json) => _$TouristSiteModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String imageUrl;
@override final  String location;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of TouristSiteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TouristSiteModelCopyWith<_TouristSiteModel> get copyWith => __$TouristSiteModelCopyWithImpl<_TouristSiteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TouristSiteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TouristSiteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,location,isFavorite);

@override
String toString() {
  return 'TouristSiteModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, location: $location, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$TouristSiteModelCopyWith<$Res> implements $TouristSiteModelCopyWith<$Res> {
  factory _$TouristSiteModelCopyWith(_TouristSiteModel value, $Res Function(_TouristSiteModel) _then) = __$TouristSiteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String imageUrl, String location, bool isFavorite
});




}
/// @nodoc
class __$TouristSiteModelCopyWithImpl<$Res>
    implements _$TouristSiteModelCopyWith<$Res> {
  __$TouristSiteModelCopyWithImpl(this._self, this._then);

  final _TouristSiteModel _self;
  final $Res Function(_TouristSiteModel) _then;

/// Create a copy of TouristSiteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? location = null,Object? isFavorite = null,}) {
  return _then(_TouristSiteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
