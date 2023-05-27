import 'package:dartz/dartz.dart';
import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_meta_model.dart';
import 'package:testusg/core/result/result.dart';
import 'package:testusg/presentation/hom_flow/dataSource/data_source_home.dart';
import 'package:testusg/presentation/hom_flow/repository/repository_home.dart';
import 'package:testusg/presentation/hom_flow/request/weather_meta_request.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';
import 'package:geolocator/geolocator.dart';

class HomeRepositoryImp extends  HomeRepository
{
  DataSourceHome dataSourceHome;
  HomeRepositoryImp(this.dataSourceHome);
 // final sessionManager=locator<SessionManager>();




  @override
  Future<Result<BaseError, WeatherMeta>> weatherRepo({WeatherMetaRequest weatherMetaRequest}) async {
    final res=await dataSourceHome.getWeatherMeta(data:weatherMetaRequest );
    // if(res.isRight()) {
    //   final data = (res as Right<BaseError, PokemonModel>).value;
    // //  sessionManager.persistToken(data.token);
    //
    // }
    return executeWithoutConvert(remoteResult: res);
  }
  @override
  Future<Result<BaseError,WeatherHourly >> weatherHourlyRepo(
      { WeatherHourlyDailyRequest weatherHourlyDailyRequest}) async{
    final res=await dataSourceHome.getWeatherHourly(data:weatherHourlyDailyRequest );

    return executeWithoutConvert(remoteResult: res);
  }

  @override
  Future<Result<BaseError,WeatherDaily >> weatherDailyRepo(
      { WeatherHourlyDailyRequest weatherHourlyDailyRequest}) async {
    final res=await dataSourceHome.getWeatherDaily(data:weatherHourlyDailyRequest );

    return executeWithoutConvert(remoteResult: res);
  }

  @override
  Future<Result<BaseError,Position >> getMyLocation() async {
  //  Geolocator geolocator = Geolocator();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    Result<BaseError,Position > res=Result(data: position);
    print("position${position.latitude}");
    return res;
  }


}