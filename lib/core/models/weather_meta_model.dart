class WeatherMeta {
  Meta meta;
  Data data;

  WeatherMeta({this.meta, this.data});

  WeatherMeta.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Meta {
  double execTime;
  String generated;

  Meta({this.execTime, this.generated});

  Meta.fromJson(Map<String, dynamic> json) {
    execTime = json['exec_time'];
    generated = json['generated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exec_time'] = this.execTime;
    data['generated'] = this.generated;
    return data;
  }
}

class Data {
  String id;
  Name name;
  String country;
  String region;
  Identifier identifier;
  Location location;
  String timezone;
  Inventory inventory;

  Data(
      {this.id,
      this.name,
      this.country,
      this.region,
      this.identifier,
      this.location,
      this.timezone,
      this.inventory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    country = json['country'];
    region = json['region'];
    identifier = json['identifier'] != null
        ? new Identifier.fromJson(json['identifier'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    timezone = json['timezone'];
    inventory = json['inventory'] != null
        ? new Inventory.fromJson(json['inventory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['country'] = this.country;
    data['region'] = this.region;
    if (this.identifier != null) {
      data['identifier'] = this.identifier.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['timezone'] = this.timezone;
    if (this.inventory != null) {
      data['inventory'] = this.inventory.toJson();
    }
    return data;
  }
}

class Name {
  String de;
  String es;
  String en;

  Name({this.de, this.es, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    de = json['de'];
    es = json['es'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['de'] = this.de;
    data['es'] = this.es;
    data['en'] = this.en;
    return data;
  }
}

class Identifier {
  String national;
  String wmo;
  String icao;

  Identifier({this.national, this.wmo, this.icao});

  Identifier.fromJson(Map<String, dynamic> json) {
    national = json['national'];
    wmo = json['wmo'];
    icao = json['icao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['national'] = this.national;
    data['wmo'] = this.wmo;
    data['icao'] = this.icao;
    return data;
  }
}

class Location {
  double latitude;
  double longitude;
  int elevation;

  Location({this.latitude, this.longitude, this.elevation});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['elevation'] = this.elevation;
    return data;
  }
}

class Inventory {
  Model model;
  Model hourly;
  Model daily;
  Monthly monthly;
  Monthly normals;

  Inventory({this.model, this.hourly, this.daily, this.monthly, this.normals});

  Inventory.fromJson(Map<String, dynamic> json) {
    model = json['model'] != null ? new Model.fromJson(json['model']) : null;
    hourly = json['hourly'] != null ? new Model.fromJson(json['hourly']) : null;
    daily = json['daily'] != null ? new Model.fromJson(json['daily']) : null;
    monthly =
        json['monthly'] != null ? new Monthly.fromJson(json['monthly']) : null;
    normals =
        json['normals'] != null ? new Monthly.fromJson(json['normals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.model != null) {
      data['model'] = this.model.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.toJson();
    }
    if (this.monthly != null) {
      data['monthly'] = this.monthly.toJson();
    }
    if (this.normals != null) {
      data['normals'] = this.normals.toJson();
    }
    return data;
  }
}

class Model {
  String start;
  String end;

  Model({this.start, this.end});

  Model.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class Monthly {
  int start;
  int end;

  Monthly({this.start, this.end});

  Monthly.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}