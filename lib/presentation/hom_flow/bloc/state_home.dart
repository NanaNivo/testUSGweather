
import 'package:equatable/equatable.dart';
import 'package:testusg/core/models/weather_meta_model.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:geolocator/geolocator.dart';

enum Utils  {metric,imperial}
class HomeState extends Equatable {
 final DataHour weatherCurrent;
 final WeatherHourly weatherHourly;
   final  WeatherDaily weatherDaily;
   final Utils utils;
   final Position position;

  const HomeState({this.weatherCurrent,this.weatherDaily,this.weatherHourly,this.utils=Utils.metric,this.position});

  HomeState copyWith({
  //  WeatherMeta weatherMeta,
    DataHour weatherCurrent,
    WeatherHourly weatherHourly,
    WeatherDaily weatherDaily,
    Utils utils,
    Position position
  }) {
    return HomeState(weatherCurrent: weatherCurrent ?? this.weatherCurrent,weatherDaily:weatherDaily??this.weatherDaily,weatherHourly:weatherHourly??this.weatherHourly,utils: utils??this.utils,position: position??this.position);
  }

  @override
  // TODO: implement props
  List<Object> get props =>[weatherCurrent,weatherHourly,weatherDaily,utils,position];
}
