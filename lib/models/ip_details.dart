import 'dart:convert';

// {
// "status": "success",
// "country": "Lebanon",
// "countryCode": "LB",
// "region": "JL",
// "regionName": "Mohafazat Mont-Liban",
// "city": "Jdaidet el Matn",
// "zip": "",
// "lat": 33.8906,
// "lon": 35.5664,
// "timezone": "Asia/Beirut",
// "isp": "WIN DSL s.a.r.l",
// "org": "Win-DSL s.a.r.l Download Satellite provider",
// "as": "AS197674 WIN DSL s.a.r.l",
// "query": "95.129.1.165"
// }
class IpDetails {
  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String as;
  final String query;
  IpDetails({
    this.status = '',
    this.country = '',
    this.countryCode = '',
    this.region = '',
    this.regionName = '',
    this.city = '',
    this.zip = '',
    this.lat = 0.0,
    this.lon = 0.0,
    this.timezone = '',
    this.isp = '',
    this.org = '',
    this.as = '',
    this.query = '',
  });

  IpDetails copyWith({
    String? status,
    String? country,
    String? countryCode,
    String? region,
    String? regionName,
    String? city,
    String? zip,
    double? lat,
    double? lon,
    String? timezone,
    String? isp,
    String? org,
    String? as,
    String? query,
  }) {
    return IpDetails(
      status: status ?? this.status,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      region: region ?? this.region,
      regionName: regionName ?? this.regionName,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      isp: isp ?? this.isp,
      org: org ?? this.org,
      as: as ?? this.as,
      query: query ?? this.query,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'country': country,
      'countryCode': countryCode,
      'region': region,
      'regionName': regionName,
      'city': city,
      'zip': zip,
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'isp': isp,
      'org': org,
      'as': as,
      'query': query,
    };
  }

  factory IpDetails.fromMap(Map<String, dynamic> map) {
    return IpDetails(
      status: map['status'] ?? '',
      country: map['country'] ?? '',
      countryCode: map['countryCode'] ?? '',
      region: map['region'] ?? '',
      regionName: map['regionName'] ?? '',
      city: map['city'] ?? '',
      zip: map['zip'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
      timezone: map['timezone'] ?? '',
      isp: map['isp'] ?? '',
      org: map['org'] ?? '',
      as: map['as'] ?? '',
      query: map['query'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory IpDetails.fromJson(String source) =>
      IpDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IpDetails(status: $status, country: $country, countryCode: $countryCode, region: $region, regionName: $regionName, city: $city, zip: $zip, lat: $lat, lon: $lon, timezone: $timezone, isp: $isp, org: $org, as: $as, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IpDetails &&
        other.status == status &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.region == region &&
        other.regionName == regionName &&
        other.city == city &&
        other.zip == zip &&
        other.lat == lat &&
        other.lon == lon &&
        other.timezone == timezone &&
        other.isp == isp &&
        other.org == org &&
        other.as == as &&
        other.query == query;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        country.hashCode ^
        countryCode.hashCode ^
        region.hashCode ^
        regionName.hashCode ^
        city.hashCode ^
        zip.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        timezone.hashCode ^
        isp.hashCode ^
        org.hashCode ^
        as.hashCode ^
        query.hashCode;
  }
}
