import 'package:equatable/equatable.dart';

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Current {
  int? lastupdatedepoch;
  String? lastupdated;
  double? tempc;
  double? tempf;
  int? isday;
  Condition? condition;
  double? windmph;
  double? windkph;
  int? winddegree;
  String? winddir;
  double? pressuremb;
  double? pressurein;
  double? precipmm;
  double? precipin;
  int? humidity;
  int? cloud;
  double? feelslikec;
  double? feelslikef;
  double? viskm;
  double? vismiles;
  double? uv;
  double? gustmph;
  double? gustkph;

  Current(
      {this.lastupdatedepoch,
      this.lastupdated,
      this.tempc,
      this.tempf,
      this.isday,
      this.condition,
      this.windmph,
      this.windkph,
      this.winddegree,
      this.winddir,
      this.pressuremb,
      this.pressurein,
      this.precipmm,
      this.precipin,
      this.humidity,
      this.cloud,
      this.feelslikec,
      this.feelslikef,
      this.viskm,
      this.vismiles,
      this.uv,
      this.gustmph,
      this.gustkph});

  Current.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> current = json['current'];
    lastupdatedepoch = current['last_updated_epoch'];
    lastupdated = current['last_updated'];
    tempc = current['temp_c'];
    tempf = current['temp_f'];
    isday = current['is_day'];
    windmph = current['wind_mph'];
    windkph = current['wind_kph'];
    winddegree = current['wind_degree'];
    winddir = current['wind_dir'];
    pressuremb = current['pressure_mb'];
    pressurein = current['pressure_in'];
    precipmm = current['precip_mm'];
    precipin = current['precip_in'];
    humidity = current['humidity'];
    cloud = current['cloud'];
    feelslikec = current['feelslike_c'];
    feelslikef = current['feelslike_f'];
    viskm = current['vis_km'];
    vismiles = current['vis_miles'];
    uv = current['uv'];
    gustmph = current['gust_mph'];
    gustkph = current['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastupdatedepoch;
    data['last_updated'] = lastupdated;
    data['temp_c'] = tempc;
    data['temp_f'] = tempf;
    data['is_day'] = isday;
    data['condition'] = condition!.toJson();
    data['wind_mph'] = windmph;
    data['wind_kph'] = windkph;
    data['wind_degree'] = winddegree;
    data['wind_dir'] = winddir;
    data['pressure_mb'] = pressuremb;
    data['pressure_in'] = pressurein;
    data['precip_mm'] = precipmm;
    data['precip_in'] = precipin;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikec;
    data['feelslike_f'] = feelslikef;
    data['vis_km'] = viskm;
    data['vis_miles'] = vismiles;
    data['uv'] = uv;
    data['gust_mph'] = gustmph;
    data['gust_kph'] = gustkph;
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzid;
  int? localtimeepoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzid,
      this.localtimeepoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzid = json['tz_id'];
    localtimeepoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzid;
    data['localtime_epoch'] = localtimeepoch;
    data['localtime'] = localtime;
    return data;
  }
}

// ignore: must_be_immutable
class Weather extends Equatable {
  Location? location;
  Current? current;

  Weather({this.location, this.current});

  Weather.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current?.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location!.toJson();
    data['current'] = current!.toJson();
    return data;
  }

  @override
  List<String?> get props => [location!.name];
}
