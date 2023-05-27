import 'package:testusg/presentation/hom_flow/bloc/bloc_home.dart';
import 'package:testusg/presentation/hom_flow/bloc/state_home.dart';

abstract class HomeEvent {}

class WeatherMetaEvent extends HomeEvent
{
  //String value;
  WeatherMetaEvent();
}
class WeatherDelayEvent extends HomeEvent
{
  final String lat;
  final String long;
 final String startDate;
 final String EndDate;
  WeatherDelayEvent({this.lat,this.long,this.startDate,this.EndDate,});
}
class WeatherHourlyEvent extends HomeEvent
{
  //final String Station;
  final String lat;
  final String long;
  final String StartTime;
  final String EndTime;
  WeatherHourlyEvent({this.StartTime,this.EndTime,this.lat,this.long});
}
class WeatherAllInfoEvent extends HomeEvent
{ final String lat;
final String long;
final String currentDate;
  final String startDate;
  final String EndDate;
  final String EndTime;
  final String units;

  WeatherAllInfoEvent({this.currentDate,this.lat,this.long,this.startDate,this.EndDate,this.EndTime,this.units});
}
class WeatherUtils extends HomeEvent
{
  final Utils utils;
  WeatherUtils({this.utils});
}
class getMyLocation extends HomeEvent
{
  getMyLocation();
}
