import 'package:testusg/core/error/base_error.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/core/param/base_param.dart';
import 'package:testusg/core/param/no_param.dart';
import 'package:testusg/core/result/result.dart';
import 'package:testusg/core/usecases/base_use_case.dart';
import 'package:testusg/presentation/hom_flow/repository/repository_home.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';
class WeatherDailyUseCase extends UseCase<Future<Result<BaseError,WeatherDaily >>,WeatherDelayParams>
{
  final HomeRepository homeRepository;
  WeatherDailyUseCase({this.homeRepository});
  @override
  Future<Result<BaseError, WeatherDaily>> call(WeatherDelayParams params) async {

    final result=await homeRepository.weatherDailyRepo(weatherHourlyDailyRequest:params.weatherHourlyDailyRequest );
    if (result.hasDataOnly) {
          print("weather${result?.data?.data?.length}");
          //result.data.data.forEach((element) async {
            for(int i=0;i<result?.data?.data?.length;i++)
              {
            WeatherDelayParams weatherDelayParams=  WeatherDelayParams(weatherHourlyDailyRequest: WeatherHourlyDailyRequest(language:params.weatherHourlyDailyRequest.language,lat: params.weatherHourlyDailyRequest.lat,long: params.weatherHourlyDailyRequest.long,start:result.data.data[i].date,end: result.data.data[i].date,units: params.weatherHourlyDailyRequest.units  ));

            final resulttemp=await homeRepository.weatherHourlyRepo(weatherHourlyDailyRequest:weatherDelayParams.weatherHourlyDailyRequest) ;
            if(resulttemp.hasDataOnly&&resulttemp?.data?.data?.isNotEmpty)
              {
            DataHour dataHour=    resulttemp.data.data.firstWhere((element2) {
                int timetemp=  DateTime.parse(element2.time).hour;
                int timenow=DateTime.now().hour;
                  if(timetemp==timenow)
                    {
                      return true;
                    }
                  return false;
                },orElse: null);
            if(dataHour!=null) {
              result.data.data[i].coco = dataHour.coco;
            }
              }
          }

      return Result(data: result.data);
    }
    return Result(error: result.error);
  }
}
class WeatherDelayParams extends BaseParams
{
  WeatherHourlyDailyRequest weatherHourlyDailyRequest;
  WeatherDelayParams({this.weatherHourlyDailyRequest});
}