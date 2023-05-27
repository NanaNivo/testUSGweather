import 'package:dartz/dartz.dart';
import 'package:testusg/core/datasources/remote_data_source.dart';
import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_meta_model.dart';
import 'package:testusg/presentation/hom_flow/request/get_location_request.dart';
import 'package:testusg/presentation/hom_flow/request/weather_meta_request.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';


abstract class DataSourceHome extends  RemoteDataSource {
  Future<Either<BaseError,WeatherMeta >> getWeatherMeta({ WeatherMetaRequest data});
  Future<Either<BaseError,WeatherHourly>> getWeatherHourly({WeatherHourlyDailyRequest data});
  Future<Either<BaseError,WeatherDaily>> getWeatherDaily({WeatherHourlyDailyRequest data});
  //Future<Either<BaseError,Object>> getMyLocation({GetLocationRequest data});
}