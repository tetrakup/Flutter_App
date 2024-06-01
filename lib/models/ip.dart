class IpInfo {
  String? ip;
  String? countryCode;
  String? countryName;
  String? regionName;
  String? cityName;
  double? latitude;
  double? longitude;
  String? zipCode;
  String? timeZone;
  String? asn;
  String? as;
  bool? isProxy;

  IpInfo(
      {this.ip,
      this.countryCode,
      this.countryName,
      this.regionName,
      this.cityName,
      this.latitude,
      this.longitude,
      this.zipCode,
      this.timeZone,
      this.asn,
      this.as,
      this.isProxy});

  IpInfo.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    regionName = json['region_name'];
    cityName = json['city_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    zipCode = json['zip_code'];
    timeZone = json['time_zone'];
    asn = json['asn'];
    as = json['as'];
    isProxy = json['is_proxy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    data['region_name'] = this.regionName;
    data['city_name'] = this.cityName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['zip_code'] = this.zipCode;
    data['time_zone'] = this.timeZone;
    data['asn'] = this.asn;
    data['as'] = this.as;
    data['is_proxy'] = this.isProxy;
    return data;
  }
}
