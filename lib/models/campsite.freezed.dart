// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Campsite _$CampsiteFromJson(Map<String, dynamic> json) {
  return _Campsite.fromJson(json);
}

/// @nodoc
mixin _$Campsite {
  /// Unique identifier for the campsite
  String get id => throw _privateConstructorUsedError;

  /// Name of the campsite
  String get label => throw _privateConstructorUsedError;

  /// Geographical location of the campsite
  GeoLocation get geoLocation => throw _privateConstructorUsedError;

  /// Whether the campsite is close to water
  bool get isCloseToWater => throw _privateConstructorUsedError;

  /// Whether campfires are allowed at the campsite
  bool get isCampFireAllowed => throw _privateConstructorUsedError;

  /// List of languages spoken by the host
  List<String> get hostLanguages => throw _privateConstructorUsedError;

  /// Price per night in euros
  double get pricePerNight => throw _privateConstructorUsedError;

  /// URL of the campsite's photo
  String get photo => throw _privateConstructorUsedError;

  /// List of features the campsite is suitable for
  List<String> get suitableFor => throw _privateConstructorUsedError;

  /// Serializes this Campsite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CampsiteCopyWith<Campsite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampsiteCopyWith<$Res> {
  factory $CampsiteCopyWith(Campsite value, $Res Function(Campsite) then) =
      _$CampsiteCopyWithImpl<$Res, Campsite>;
  @useResult
  $Res call({
    String id,
    String label,
    GeoLocation geoLocation,
    bool isCloseToWater,
    bool isCampFireAllowed,
    List<String> hostLanguages,
    double pricePerNight,
    String photo,
    List<String> suitableFor,
  });

  $GeoLocationCopyWith<$Res> get geoLocation;
}

/// @nodoc
class _$CampsiteCopyWithImpl<$Res, $Val extends Campsite>
    implements $CampsiteCopyWith<$Res> {
  _$CampsiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? geoLocation = null,
    Object? isCloseToWater = null,
    Object? isCampFireAllowed = null,
    Object? hostLanguages = null,
    Object? pricePerNight = null,
    Object? photo = null,
    Object? suitableFor = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            geoLocation: null == geoLocation
                ? _value.geoLocation
                : geoLocation // ignore: cast_nullable_to_non_nullable
                      as GeoLocation,
            isCloseToWater: null == isCloseToWater
                ? _value.isCloseToWater
                : isCloseToWater // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCampFireAllowed: null == isCampFireAllowed
                ? _value.isCampFireAllowed
                : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
                      as bool,
            hostLanguages: null == hostLanguages
                ? _value.hostLanguages
                : hostLanguages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            pricePerNight: null == pricePerNight
                ? _value.pricePerNight
                : pricePerNight // ignore: cast_nullable_to_non_nullable
                      as double,
            photo: null == photo
                ? _value.photo
                : photo // ignore: cast_nullable_to_non_nullable
                      as String,
            suitableFor: null == suitableFor
                ? _value.suitableFor
                : suitableFor // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res> get geoLocation {
    return $GeoLocationCopyWith<$Res>(_value.geoLocation, (value) {
      return _then(_value.copyWith(geoLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CampsiteImplCopyWith<$Res>
    implements $CampsiteCopyWith<$Res> {
  factory _$$CampsiteImplCopyWith(
    _$CampsiteImpl value,
    $Res Function(_$CampsiteImpl) then,
  ) = __$$CampsiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    GeoLocation geoLocation,
    bool isCloseToWater,
    bool isCampFireAllowed,
    List<String> hostLanguages,
    double pricePerNight,
    String photo,
    List<String> suitableFor,
  });

  @override
  $GeoLocationCopyWith<$Res> get geoLocation;
}

/// @nodoc
class __$$CampsiteImplCopyWithImpl<$Res>
    extends _$CampsiteCopyWithImpl<$Res, _$CampsiteImpl>
    implements _$$CampsiteImplCopyWith<$Res> {
  __$$CampsiteImplCopyWithImpl(
    _$CampsiteImpl _value,
    $Res Function(_$CampsiteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? geoLocation = null,
    Object? isCloseToWater = null,
    Object? isCampFireAllowed = null,
    Object? hostLanguages = null,
    Object? pricePerNight = null,
    Object? photo = null,
    Object? suitableFor = null,
  }) {
    return _then(
      _$CampsiteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        geoLocation: null == geoLocation
            ? _value.geoLocation
            : geoLocation // ignore: cast_nullable_to_non_nullable
                  as GeoLocation,
        isCloseToWater: null == isCloseToWater
            ? _value.isCloseToWater
            : isCloseToWater // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCampFireAllowed: null == isCampFireAllowed
            ? _value.isCampFireAllowed
            : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
                  as bool,
        hostLanguages: null == hostLanguages
            ? _value._hostLanguages
            : hostLanguages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        pricePerNight: null == pricePerNight
            ? _value.pricePerNight
            : pricePerNight // ignore: cast_nullable_to_non_nullable
                  as double,
        photo: null == photo
            ? _value.photo
            : photo // ignore: cast_nullable_to_non_nullable
                  as String,
        suitableFor: null == suitableFor
            ? _value._suitableFor
            : suitableFor // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CampsiteImpl extends _Campsite {
  const _$CampsiteImpl({
    required this.id,
    required this.label,
    required this.geoLocation,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required final List<String> hostLanguages,
    required this.pricePerNight,
    required this.photo,
    final List<String> suitableFor = const [],
  }) : _hostLanguages = hostLanguages,
       _suitableFor = suitableFor,
       super._();

  factory _$CampsiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$CampsiteImplFromJson(json);

  /// Unique identifier for the campsite
  @override
  final String id;

  /// Name of the campsite
  @override
  final String label;

  /// Geographical location of the campsite
  @override
  final GeoLocation geoLocation;

  /// Whether the campsite is close to water
  @override
  final bool isCloseToWater;

  /// Whether campfires are allowed at the campsite
  @override
  final bool isCampFireAllowed;

  /// List of languages spoken by the host
  final List<String> _hostLanguages;

  /// List of languages spoken by the host
  @override
  List<String> get hostLanguages {
    if (_hostLanguages is EqualUnmodifiableListView) return _hostLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hostLanguages);
  }

  /// Price per night in euros
  @override
  final double pricePerNight;

  /// URL of the campsite's photo
  @override
  final String photo;

  /// List of features the campsite is suitable for
  final List<String> _suitableFor;

  /// List of features the campsite is suitable for
  @override
  @JsonKey()
  List<String> get suitableFor {
    if (_suitableFor is EqualUnmodifiableListView) return _suitableFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableFor);
  }

  @override
  String toString() {
    return 'Campsite(id: $id, label: $label, geoLocation: $geoLocation, isCloseToWater: $isCloseToWater, isCampFireAllowed: $isCampFireAllowed, hostLanguages: $hostLanguages, pricePerNight: $pricePerNight, photo: $photo, suitableFor: $suitableFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampsiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.geoLocation, geoLocation) ||
                other.geoLocation == geoLocation) &&
            (identical(other.isCloseToWater, isCloseToWater) ||
                other.isCloseToWater == isCloseToWater) &&
            (identical(other.isCampFireAllowed, isCampFireAllowed) ||
                other.isCampFireAllowed == isCampFireAllowed) &&
            const DeepCollectionEquality().equals(
              other._hostLanguages,
              _hostLanguages,
            ) &&
            (identical(other.pricePerNight, pricePerNight) ||
                other.pricePerNight == pricePerNight) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            const DeepCollectionEquality().equals(
              other._suitableFor,
              _suitableFor,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    geoLocation,
    isCloseToWater,
    isCampFireAllowed,
    const DeepCollectionEquality().hash(_hostLanguages),
    pricePerNight,
    photo,
    const DeepCollectionEquality().hash(_suitableFor),
  );

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampsiteImplCopyWith<_$CampsiteImpl> get copyWith =>
      __$$CampsiteImplCopyWithImpl<_$CampsiteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CampsiteImplToJson(this);
  }
}

abstract class _Campsite extends Campsite {
  const factory _Campsite({
    required final String id,
    required final String label,
    required final GeoLocation geoLocation,
    required final bool isCloseToWater,
    required final bool isCampFireAllowed,
    required final List<String> hostLanguages,
    required final double pricePerNight,
    required final String photo,
    final List<String> suitableFor,
  }) = _$CampsiteImpl;
  const _Campsite._() : super._();

  factory _Campsite.fromJson(Map<String, dynamic> json) =
      _$CampsiteImpl.fromJson;

  /// Unique identifier for the campsite
  @override
  String get id;

  /// Name of the campsite
  @override
  String get label;

  /// Geographical location of the campsite
  @override
  GeoLocation get geoLocation;

  /// Whether the campsite is close to water
  @override
  bool get isCloseToWater;

  /// Whether campfires are allowed at the campsite
  @override
  bool get isCampFireAllowed;

  /// List of languages spoken by the host
  @override
  List<String> get hostLanguages;

  /// Price per night in euros
  @override
  double get pricePerNight;

  /// URL of the campsite's photo
  @override
  String get photo;

  /// List of features the campsite is suitable for
  @override
  List<String> get suitableFor;

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampsiteImplCopyWith<_$CampsiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return _GeoLocation.fromJson(json);
}

/// @nodoc
mixin _$GeoLocation {
  /// Latitude coordinate
  double get lat => throw _privateConstructorUsedError;

  /// Longitude coordinate
  @JsonKey(name: 'long')
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this GeoLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoLocationCopyWith<GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationCopyWith<$Res> {
  factory $GeoLocationCopyWith(
    GeoLocation value,
    $Res Function(GeoLocation) then,
  ) = _$GeoLocationCopyWithImpl<$Res, GeoLocation>;
  @useResult
  $Res call({double lat, @JsonKey(name: 'long') double lng});
}

/// @nodoc
class _$GeoLocationCopyWithImpl<$Res, $Val extends GeoLocation>
    implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null}) {
    return _then(
      _value.copyWith(
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lng: null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeoLocationImplCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$$GeoLocationImplCopyWith(
    _$GeoLocationImpl value,
    $Res Function(_$GeoLocationImpl) then,
  ) = __$$GeoLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, @JsonKey(name: 'long') double lng});
}

/// @nodoc
class __$$GeoLocationImplCopyWithImpl<$Res>
    extends _$GeoLocationCopyWithImpl<$Res, _$GeoLocationImpl>
    implements _$$GeoLocationImplCopyWith<$Res> {
  __$$GeoLocationImplCopyWithImpl(
    _$GeoLocationImpl _value,
    $Res Function(_$GeoLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null}) {
    return _then(
      _$GeoLocationImpl(
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lng: null == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoLocationImpl extends _GeoLocation {
  const _$GeoLocationImpl({
    required this.lat,
    @JsonKey(name: 'long') required this.lng,
  }) : super._();

  factory _$GeoLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoLocationImplFromJson(json);

  /// Latitude coordinate
  @override
  final double lat;

  /// Longitude coordinate
  @override
  @JsonKey(name: 'long')
  final double lng;

  @override
  String toString() {
    return 'GeoLocation(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoLocationImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of GeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoLocationImplCopyWith<_$GeoLocationImpl> get copyWith =>
      __$$GeoLocationImplCopyWithImpl<_$GeoLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoLocationImplToJson(this);
  }
}

abstract class _GeoLocation extends GeoLocation {
  const factory _GeoLocation({
    required final double lat,
    @JsonKey(name: 'long') required final double lng,
  }) = _$GeoLocationImpl;
  const _GeoLocation._() : super._();

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$GeoLocationImpl.fromJson;

  /// Latitude coordinate
  @override
  double get lat;

  /// Longitude coordinate
  @override
  @JsonKey(name: 'long')
  double get lng;

  /// Create a copy of GeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoLocationImplCopyWith<_$GeoLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
