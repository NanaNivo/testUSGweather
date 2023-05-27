


import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_meta_model.dart';
import 'package:testusg/core/repositories/repository.dart';
import 'package:testusg/core/result/result.dart';
import 'package:testusg/presentation/hom_flow/request/weather_meta_request.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';
import 'package:geolocator/geolocator.dart';
abstract class HomeRepository extends Repository {

  Future<Result<BaseError,WeatherMeta >> weatherRepo(
      { WeatherMetaRequest weatherMetaRequest});
  Future<Result<BaseError,WeatherHourly >> weatherHourlyRepo(
      { WeatherHourlyDailyRequest weatherHourlyDailyRequest});

  Future<Result<BaseError,WeatherDaily >> weatherDailyRepo(
      { WeatherHourlyDailyRequest weatherHourlyDailyRequest});


  Future<Result<BaseError,Position >> getMyLocation();

}