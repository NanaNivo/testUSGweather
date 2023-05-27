import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/core/param/base_param.dart';
import 'package:testusg/core/param/no_param.dart';
import 'package:testusg/core/result/result.dart';
import 'package:testusg/core/usecases/base_use_case.dart';
import 'package:testusg/presentation/hom_flow/repository/repository_home.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';

class WeatherHourlyUseCase extends UseCase<Future<Result<BaseError,WeatherHourly >>,WeatherHourlyParams>
{
  final HomeRepository homeRepository;
  WeatherHourlyUseCase({this.homeRepository});
  @override
  Future<Result<BaseError, WeatherHourly>> call(WeatherHourlyParams params) async {

    final result=await homeRepository.weatherHourlyRepo(weatherHourlyDailyRequest:params.weatherHourlyDailyRequest );
    if (result.hasDataOnly) {

          // result.data.data.forEach((element) {
          //   element.icon=_getWeatherIcon(element.coco);
          // })
          // print("result.data${result.data.data[0].icon}");

      return Result(data: result.data);
    }
    return Result(error: result.error);
  }
}
class WeatherHourlyParams extends BaseParams
{
  WeatherHourlyDailyRequest weatherHourlyDailyRequest;
  WeatherHourlyParams({this.weatherHourlyDailyRequest});
}

