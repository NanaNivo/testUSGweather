import 'package:dartz/dartz.dart';
import 'package:testusg/core/enums/api/HttpMethod.dart';
import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_meta_model.dart';
import 'package:testusg/core/resources/strings.dart';
import 'package:testusg/presentation/hom_flow/dataSource/data_source_home.dart';
import 'package:testusg/presentation/hom_flow/request/get_location_request.dart';
import 'package:testusg/presentation/hom_flow/request/weather_meta_request.dart';
import 'package:testusg/presentation/hom_flow/response/weather_meta_response.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/presentation/hom_flow/response/Weather_hourly.dart';
import 'package:testusg/presentation/hom_flow/response/Weather_daily_response.dart';



class DataSourceHomeImp extends DataSourceHome
{
  @override
  Future<Either<BaseError, WeatherMeta>> getWeatherMeta({WeatherMetaRequest data}) {
    return request< WeatherMeta, WeatherMetaResponse>(
        responseStr: 'WeatherMetaResponse',
        mapper: (json) => WeatherMetaResponse.fromJson(json),
        method: HttpMethod.GET,

        data: data.toJson(),
       acceptLang: data.language??'en',
        url: '${MetaData}');
  }

  @override
  Future<Either<BaseError,WeatherHourly>> getWeatherHourly({WeatherHourlyDailyRequest data})
  {
    return request< WeatherHourly, WeatherHourlyResponse>(
        responseStr: 'WeatherHourlyResponse',
        mapper: (json) => WeatherHourlyResponse.fromJson(json),
        method: HttpMethod.GET,

        data: data.toJson(),
        acceptLang: data.language??'en',
        url: '${hourly}');
  }

  @override
  Future<Either<BaseError,WeatherDaily>> getWeatherDaily({WeatherHourlyDailyRequest data})
  {
    return request< WeatherDaily, WeatherDailyResponse>(
        responseStr: 'WeatherDailyResponse',
        mapper: (json) => WeatherDailyResponse.fromJson(json),
        method: HttpMethod.GET,

        data: data.toJson(),
        acceptLang: data.language??'en',
        url: '${daily}');
  }

  @override
  Future<Either<BaseError, Object>> getMyLocation({GetLocationRequest data}) {

  }




}