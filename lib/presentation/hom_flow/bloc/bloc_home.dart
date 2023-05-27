
import 'package:bloc/bloc.dart';
import 'package:testusg/core/models/weather_hourly_daily_model.dart';
import 'package:testusg/presentation/custom_widgets/animation/bottom_animation.dart';
import 'package:testusg/presentation/hom_flow/bloc/event_home.dart';
import 'package:testusg/presentation/hom_flow/bloc/state_home.dart';
import 'package:testusg/presentation/hom_flow/request/Weather_hourly_daily_request.dart';
import 'package:testusg/presentation/hom_flow/request/weather_meta_request.dart';
import 'package:testusg/presentation/hom_flow/usecase/usecase_get_location.dart';
import 'package:testusg/presentation/hom_flow/usecase/usecase_weather_meta.dart';
import 'package:testusg/presentation/hom_flow/usecase/usecase_weather_daily.dart';
import 'package:testusg/presentation/hom_flow/usecase/usecase_weather_hourly.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherMetaUseCase weatherMetaUseCase;
  final WeatherHourlyUseCase weatherHourlyUseCase;
  final WeatherDailyUseCase weatherDailyUseCase;
  final LocationUseCase locationUseCase;
  HomeBloc({this.weatherMetaUseCase,this.weatherDailyUseCase,this.weatherHourlyUseCase,this.locationUseCase}) : super(const HomeState()) {
    /// App Events
   //  on<WeatherMetaEvent>(_onWeatherMetaEvent);
     on<WeatherDelayEvent>(_onWeatherDelayEvent);
     on<WeatherHourlyEvent>(_onWeatherHourlyEvent);
     on<WeatherAllInfoEvent>(_onAllWeatherInfo);
     on<WeatherUtils>(_onUtilsChange);
     on<getMyLocation>(_ongetMyLocation);
    // on<ClearValue>(_onClearValue);
    // on<ChangeShape>(_onChangeShape);
  }
}

extension HomeBlocMappers on HomeBloc {
  // void _onWeatherMetaEvent(WeatherMetaEvent event, Emitter<HomeState> emit) async {
  //  final res=await  weatherMetaUseCase(WeatherMetaParams(weatherMetaRequest: WeatherMetaRequest()));
  //  if(res.hasDataOnly) {
  //    emit(state.copyWith(weatherMeta:res.data));
  //  }
  // }
  void _onWeatherDelayEvent(WeatherDelayEvent event,Emitter<HomeState> emit) async
  {
    final res=await  weatherDailyUseCase(WeatherDelayParams(weatherHourlyDailyRequest: WeatherHourlyDailyRequest(lat:event.lat,long:event.long,start: event.startDate,end: event.EndDate)));
    if(res.hasDataOnly) {
      emit(state.copyWith(weatherDaily:res.data));
    }
  }
  void _onWeatherHourlyEvent(WeatherHourlyEvent event,Emitter<HomeState> emit) async{
    final res=await  weatherHourlyUseCase(WeatherHourlyParams(weatherHourlyDailyRequest: WeatherHourlyDailyRequest( lat:event.lat,long:event.long,start: event.StartTime,end: event.EndTime)));
    if(res.hasDataOnly) {

      emit(state.copyWith(weatherHourly:res.data));
    }
    }
    Future<void> _onAllWeatherInfo(WeatherAllInfoEvent event,Emitter<HomeState> emit)
    async {
      emit(state.copyWith(weatherCurrent:null,weatherDaily:null,weatherHourly: null,utils:Utils.imperial.name== event.units?Utils.imperial:Utils.metric.name== event.units?Utils.metric:state.utils ));
      final res=await Future.wait([weatherDailyUseCase(WeatherDelayParams(weatherHourlyDailyRequest: WeatherHourlyDailyRequest(lat:event.lat,long:event.long,start: event.startDate,end: event.EndDate,units:event.units))),weatherHourlyUseCase(WeatherHourlyParams(weatherHourlyDailyRequest: WeatherHourlyDailyRequest( lat:event.lat,long:event.long,start: event.startDate,end: event.EndTime,units:event.units)))]);
           if(res[0].hasDataOnly&&res[1].hasDataOnly)
             {
               WeatherHourly temp=res[1].data;
               WeatherDaily tempDaily=res[0].data;
               DataHour dataHour= temp.data.firstWhere((element)
               {
               final timeElement=  DateTime.parse(element.time);
               final timeNow=DateTime.parse(event.currentDate);

                 if(timeElement.hour == timeNow.hour)
                   {
                     return true;
                   }
                 return false;

                 },);
               // tempDaily.data.forEach((element) {
               //   weatherHourlyUseCase(WeatherHourlyParams(weatherHourlyDailyRequest: WeatherHourlyDailyRequest( lat:event.lat,long:event.long,start: event.startDate,end: event.EndTime)))
               // });

               emit(state.copyWith(weatherCurrent:dataHour,weatherDaily: res[0].data,weatherHourly: res[1].data,utils:Utils.imperial.name== event.units?Utils.imperial:Utils.metric.name== event.units?Utils.metric:state.utils));

             }
    }

    Future<void> _onUtilsChange(WeatherUtils event,Emitter<HomeState> emit)
    {
      emit(state.copyWith(utils:event.utils ));
    }
    Future<void> _ongetMyLocation(getMyLocation event,Emitter<HomeState> emit)
    async {
      final res=await  locationUseCase.homeRepository.getMyLocation();
      if(res.hasDataOnly) {
        print("data");
        emit(state.copyWith(position: res.data));

      }
    }
  // void _onClearValue(ClearValue event, Emitter<HomeState> emit) async {
  //
  //   emit(state.copyWith(valueCleared: true,valueChanged: ""));
  // }
  // void _onChangeShape(ChangeShape event,Emitter<HomeState> emit) async {
  //   emit(state.copyWith(shapeChanged: event.shape));
  // }

}
extension HomeBlocEvent on HomeBloc
{
  void setDataWeather(
      {String lat,
      String long,
      String start,
      String endDate,
      endTime,
      String currentDate,String units})
  {
   // add(WeatherMetaEvent());
    add(WeatherAllInfoEvent(lat: lat,long: long,startDate: start,EndDate: endDate,EndTime: endTime,currentDate: currentDate,units: units));
  }
  void setWeatherHourly({String lat,String long, String start, String end})
  {
    add(WeatherHourlyEvent(lat:lat,long:long,StartTime: start,EndTime: end));
  }
  void setWeatherDaily({String lat,String long, String start, String end})
  {
    add(WeatherDelayEvent(lat:lat,long:long,startDate: start,EndDate: end));
  }
  void setWeatherUtils(Utils utils)
  {
    add(WeatherUtils(utils: utils));
}
  // void setClear()
  // {
  //   add(ClearValue());
  // }
  // void shangeShape(int shape)
  // {
  //   add(ChangeShape(shape: shape));
  // }
}
