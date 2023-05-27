import 'package:flutter/material.dart';
class WeatherDaily {
  Meta meta;
  List<Data> data;

  WeatherDaily({this.meta, this.data});

  WeatherDaily.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String generated;
  String coco;

  Meta({this.generated,this.coco});

  Meta.fromJson(Map<String, dynamic> json) {
    generated = json['generated'];
    coco=json['coco'];
    print('json${json['coco']}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['generated'] = this.generated;
    return data;
  }
}

class Data {
  String date;
  String time;
  double tavg;
  double tmin;
  double tmax;
  double prcp;
  double snow;
  double wdir;
  double wspd;
  double wpgt;
  double pres;
  double tsun;
  int coco;
  Data(
      {this.date,
        this.time,
        this.tavg,
        this.tmin,
        this.tmax,
        this.prcp,
        this.snow,
        this.wdir,
        this.wspd,
        this.wpgt,
        this.pres,
        this.tsun,this.coco});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
   // time=json['time'];

    tavg = json['tavg'];

    tmin = json['tmin'];

    tmax = json['tmax'];

    prcp = json['prcp'];

    snow = json['snow'];

    wdir = json['wdir'];

    wspd = json['wspd'];

    wpgt = json['wpgt'];

    pres = json['pres'];

    tsun = json['tsun'];
    coco = json['coco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(data['date']!=null) {
      data['date'] = this.date;
    }
    // if(data['time']!=null)
    //     {
    //     data['time']=this.time;
    //     }

    print("bbb");
    data['tavg'] = this.tavg;
    data['tmin'] = this.tmin;
    data['tmax'] = this.tmax;
    data['prcp'] = this.prcp;
    data['snow'] = this.snow;
    data['wdir'] = this.wdir;
    data['wspd'] = this.wspd;
    data['wpgt'] = this.wpgt;
    data['pres'] = this.pres;
    data['tsun'] = this.tsun;
    data['coco'] = this.coco;
    return data;
  }
}


class WeatherHourly {
  Meta meta;
  List<DataHour> data;

  WeatherHourly({this.meta, this.data});

  WeatherHourly.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<DataHour>();
      json['data'].forEach((v) {
        data.add(new DataHour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataHour {
  String time;
  double temp;
  double dwpt;
  double rhum;
  double prcp;
  double snow;
  double wdir;
  double wspd;
  double wpgt;
  double pres;
  int tsun;
  int coco;
 // IconData icon;
   String icon;

  DataHour(
      {this.time,
        this.temp,
        this.dwpt,
        this.rhum,
        this.prcp,
        this.snow,
        this.wdir,
        this.wspd,
        this.wpgt,
        this.pres,
        this.tsun,
        this.coco,this.icon});

  DataHour.fromJson(Map<String, dynamic> json) {
    time = json['time'];

    temp = json['temp'];

    dwpt = json['dwpt'];

    rhum = json['rhum'];

    prcp = json['prcp'];

    snow = json['snow'];

    wdir = json['wdir'];

    wspd = json['wspd'];

    wpgt = json['wpgt'];

    pres = json['pres'];

    tsun = json['tsun'];

    coco = json['coco'];
    icon=json['icon'];
    print("lll");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temp'] = this.temp;
    data['dwpt'] = this.dwpt;
    data['rhum'] = this.rhum;
    data['prcp'] = this.prcp;
    data['snow'] = this.snow;
    data['wdir'] = this.wdir;
    data['wspd'] = this.wspd;
    data['wpgt'] = this.wpgt;
    data['pres'] = this.pres;
    data['tsun'] = this.tsun;
    data['coco'] = this.coco;
    return data;
  }
}
