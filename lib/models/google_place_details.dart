import 'dart:convert';

import 'package:flutter/foundation.dart';

class GooglePlaceFromPlaceId {
  final List<dynamic> html_attributions;
  final Result result;
  final String status;
  GooglePlaceFromPlaceId({
    this.html_attributions = const [],
    required this.result,
    this.status = '',
  });

  GooglePlaceFromPlaceId copyWith({
    List<dynamic>? html_attributions,
    Result? result,
    String? status,
  }) {
    return GooglePlaceFromPlaceId(
      html_attributions: html_attributions ?? this.html_attributions,
      result: result ?? this.result,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'html_attributions': html_attributions,
      'result': result.toMap(),
      'status': status,
    };
  }

  factory GooglePlaceFromPlaceId.fromMap(Map<String, dynamic> map) {
    return GooglePlaceFromPlaceId(
      html_attributions:
          List<dynamic>.from(map['html_attributions'] ?? const []),
      result: Result.fromMap(map['result']),
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GooglePlaceFromPlaceId.fromJson(String source) =>
      GooglePlaceFromPlaceId.fromMap(json.decode(source));

  @override
  String toString() =>
      'GooglePlace(html_attributions: $html_attributions, result: $result, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GooglePlaceFromPlaceId &&
        listEquals(other.html_attributions, html_attributions) &&
        other.result == result &&
        other.status == status;
  }

  @override
  int get hashCode =>
      html_attributions.hashCode ^ result.hashCode ^ status.hashCode;
}

class Result {
  final List<AddressComponent> address_components;
  final String adr_address;
  final String formatted_address;
  final Geometry geometry;
  final String icon;
  final String icon_background_color;
  final String icon_mask_base_uri;
  final String name;
  final List<Photo> photos;
  final String place_id;
  final String reference;
  final List<String> types;
  final String url;
  final int utc_offset;
  final String vicinity;
  Result({
    this.address_components = const [],
    this.adr_address = '',
    this.formatted_address = '',
    required this.geometry,
    this.icon = '',
    this.icon_background_color = '',
    this.icon_mask_base_uri = '',
    this.name = '',
    this.photos = const [],
    this.place_id = '',
    this.reference = '',
    this.types = const [],
    this.url = '',
    this.utc_offset = 0,
    this.vicinity = '',
  });

  Result copyWith({
    List<AddressComponent>? address_components,
    String? adr_address,
    String? formatted_address,
    Geometry? geometry,
    String? icon,
    String? icon_background_color,
    String? icon_mask_base_uri,
    String? name,
    List<Photo>? photos,
    String? place_id,
    String? reference,
    List<String>? types,
    String? url,
    int? utc_offset,
    String? vicinity,
  }) {
    return Result(
      address_components: address_components ?? this.address_components,
      adr_address: adr_address ?? this.adr_address,
      formatted_address: formatted_address ?? this.formatted_address,
      geometry: geometry ?? this.geometry,
      icon: icon ?? this.icon,
      icon_background_color:
          icon_background_color ?? this.icon_background_color,
      icon_mask_base_uri: icon_mask_base_uri ?? this.icon_mask_base_uri,
      name: name ?? this.name,
      photos: photos ?? this.photos,
      place_id: place_id ?? this.place_id,
      reference: reference ?? this.reference,
      types: types ?? this.types,
      url: url ?? this.url,
      utc_offset: utc_offset ?? this.utc_offset,
      vicinity: vicinity ?? this.vicinity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address_components': address_components.map((x) => x.toMap()).toList(),
      'adr_address': adr_address,
      'formatted_address': formatted_address,
      'geometry': geometry.toMap(),
      'icon': icon,
      'icon_background_color': icon_background_color,
      'icon_mask_base_uri': icon_mask_base_uri,
      'name': name,
      'photos': photos.map((x) => x.toMap()).toList(),
      'place_id': place_id,
      'reference': reference,
      'types': types,
      'url': url,
      'utc_offset': utc_offset,
      'vicinity': vicinity,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      address_components: List<AddressComponent>.from(
          map['address_components']?.map((x) => AddressComponent.fromMap(x)) ??
              const []),
      adr_address: map['adr_address'] ?? '',
      formatted_address: map['formatted_address'] ?? '',
      geometry: Geometry.fromMap(map['geometry']),
      icon: map['icon'] ?? '',
      icon_background_color: map['icon_background_color'] ?? '',
      icon_mask_base_uri: map['icon_mask_base_uri'] ?? '',
      name: map['name'] ?? '',
      photos: List<Photo>.from(
          map['photos']?.map((x) => Photo.fromMap(x)) ?? const []),
      place_id: map['place_id'] ?? '',
      reference: map['reference'] ?? '',
      types: List<String>.from(map['types'] ?? const []),
      url: map['url'] ?? '',
      utc_offset: map['utc_offset']?.toInt() ?? 0,
      vicinity: map['vicinity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(address_components: $address_components, adr_address: $adr_address, formatted_address: $formatted_address, geometry: $geometry, icon: $icon, icon_background_color: $icon_background_color, icon_mask_base_uri: $icon_mask_base_uri, name: $name, photos: $photos, place_id: $place_id, reference: $reference, types: $types, url: $url, utc_offset: $utc_offset, vicinity: $vicinity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Result &&
        listEquals(other.address_components, address_components) &&
        other.adr_address == adr_address &&
        other.formatted_address == formatted_address &&
        other.geometry == geometry &&
        other.icon == icon &&
        other.icon_background_color == icon_background_color &&
        other.icon_mask_base_uri == icon_mask_base_uri &&
        other.name == name &&
        listEquals(other.photos, photos) &&
        other.place_id == place_id &&
        other.reference == reference &&
        listEquals(other.types, types) &&
        other.url == url &&
        other.utc_offset == utc_offset &&
        other.vicinity == vicinity;
  }

  @override
  int get hashCode {
    return address_components.hashCode ^
        adr_address.hashCode ^
        formatted_address.hashCode ^
        geometry.hashCode ^
        icon.hashCode ^
        icon_background_color.hashCode ^
        icon_mask_base_uri.hashCode ^
        name.hashCode ^
        photos.hashCode ^
        place_id.hashCode ^
        reference.hashCode ^
        types.hashCode ^
        url.hashCode ^
        utc_offset.hashCode ^
        vicinity.hashCode;
  }
}

class AddressComponent {
  final String long_name;
  final String short_name;
  final List<String> types;
  AddressComponent({
    this.long_name = '',
    this.short_name = '',
    this.types = const [],
  });

  AddressComponent copyWith({
    String? long_name,
    String? short_name,
    List<String>? types,
  }) {
    return AddressComponent(
      long_name: long_name ?? this.long_name,
      short_name: short_name ?? this.short_name,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'long_name': long_name,
      'short_name': short_name,
      'types': types,
    };
  }

  factory AddressComponent.fromMap(Map<String, dynamic> map) {
    return AddressComponent(
      long_name: map['long_name'] ?? '',
      short_name: map['short_name'] ?? '',
      types: List<String>.from(map['types'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressComponent.fromJson(String source) =>
      AddressComponent.fromMap(json.decode(source));

  @override
  String toString() =>
      'AddressComponent(long_name: $long_name, short_name: $short_name, types: $types)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressComponent &&
        other.long_name == long_name &&
        other.short_name == short_name &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode => long_name.hashCode ^ short_name.hashCode ^ types.hashCode;
}

class Geometry {
  final Location location;
  final Viewport viewport;
  Geometry({
    required this.location,
    required this.viewport,
  });

  Geometry copyWith({
    Location? location,
    Viewport? viewport,
  }) {
    return Geometry(
      location: location ?? this.location,
      viewport: viewport ?? this.viewport,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'location': location.toMap(),
      'viewport': viewport.toMap(),
    };
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      location: Location.fromMap(map['location']),
      viewport: Viewport.fromMap(map['viewport']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Geometry.fromJson(String source) =>
      Geometry.fromMap(json.decode(source));

  @override
  String toString() => 'Geometry(location: $location, viewport: $viewport)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geometry &&
        other.location == location &&
        other.viewport == viewport;
  }

  @override
  int get hashCode => location.hashCode ^ viewport.hashCode;
}

class Location {
  final double lat;
  final double lng;
  Location({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  Location copyWith({
    double? lat,
    double? lng,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class Viewport {
  final Northeast northeast;
  final Southwest southwest;
  Viewport({
    required this.northeast,
    required this.southwest,
  });

  Viewport copyWith({
    Northeast? northeast,
    Southwest? southwest,
  }) {
    return Viewport(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'northeast': northeast.toMap(),
      'southwest': southwest.toMap(),
    };
  }

  factory Viewport.fromMap(Map<String, dynamic> map) {
    return Viewport(
      northeast: Northeast.fromMap(map['northeast']),
      southwest: Southwest.fromMap(map['southwest']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Viewport.fromJson(String source) =>
      Viewport.fromMap(json.decode(source));

  @override
  String toString() => 'Viewport(northeast: $northeast, southwest: $southwest)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Viewport &&
        other.northeast == northeast &&
        other.southwest == southwest;
  }

  @override
  int get hashCode => northeast.hashCode ^ southwest.hashCode;
}

class Northeast {
  final double lat;
  final double lng;
  Northeast({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  Northeast copyWith({
    double? lat,
    double? lng,
  }) {
    return Northeast(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Northeast.fromMap(Map<String, dynamic> map) {
    return Northeast(
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Northeast.fromJson(String source) =>
      Northeast.fromMap(json.decode(source));

  @override
  String toString() => 'Northeast(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Northeast && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class Southwest {
  final double lat;
  final double lng;
  Southwest({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  Southwest copyWith({
    double? lat,
    double? lng,
  }) {
    return Southwest(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Southwest.fromMap(Map<String, dynamic> map) {
    return Southwest(
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Southwest.fromJson(String source) =>
      Southwest.fromMap(json.decode(source));

  @override
  String toString() => 'Southwest(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Southwest && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class Photo {
  final int height;
  final List<String> html_attributions;
  final String photo_reference;
  final int width;
  Photo({
    this.height = 0,
    this.html_attributions = const [],
    this.photo_reference = '',
    this.width = 0,
  });

  Photo copyWith({
    int? height,
    List<String>? html_attributions,
    String? photo_reference,
    int? width,
  }) {
    return Photo(
      height: height ?? this.height,
      html_attributions: html_attributions ?? this.html_attributions,
      photo_reference: photo_reference ?? this.photo_reference,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'html_attributions': html_attributions,
      'photo_reference': photo_reference,
      'width': width,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      height: map['height']?.toInt() ?? 0,
      html_attributions:
          List<String>.from(map['html_attributions'] ?? const []),
      photo_reference: map['photo_reference'] ?? '',
      width: map['width']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photo(height: $height, html_attributions: $html_attributions, photo_reference: $photo_reference, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Photo &&
        other.height == height &&
        listEquals(other.html_attributions, html_attributions) &&
        other.photo_reference == photo_reference &&
        other.width == width;
  }

  @override
  int get hashCode {
    return height.hashCode ^
        html_attributions.hashCode ^
        photo_reference.hashCode ^
        width.hashCode;
  }
}
