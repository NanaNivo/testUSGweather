class WeatherHourlyDailyRequest {
  // CoverageModel coverageModel;
//final int page;
  final String language;
  final String lat;
  final String long;
  final String start;
  final String end;
  final String units;
  WeatherHourlyDailyRequest({this.language,this.lat,this.long,this.start,this.end,this.units});

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = <String, dynamic>{
      'lat': lat,
      'lon':long,
      'start': start,
      'end': end,
      if(units!=null)
          'units': units

    };
    return data;
  }
}