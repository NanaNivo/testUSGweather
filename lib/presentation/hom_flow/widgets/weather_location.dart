import 'package:flutter/material.dart';
import 'package:testusg/app+injection/di.dart';
import 'package:testusg/core/resources/colors.dart';
import 'package:testusg/core/resources/constants.dart';
import 'package:testusg/presentation/custom_widgets/text_translation.dart';
import 'package:testusg/presentation/hom_flow/bloc/bloc_home.dart';
import 'package:testusg/presentation/hom_flow/bloc/event_home.dart';
import 'package:testusg/presentation/hom_flow/bloc/state_home.dart';
import 'package:testusg/presentation/hom_flow/usecase/usecase_get_location.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherLocation extends StatefulWidget
{
  @override
  State<WeatherLocation> createState() => _WeatherLocationState();
}

class _WeatherLocationState extends State<WeatherLocation> {
 final homBloc=locator<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Right clothes , no bad weather ",style: TextStyle(color: locator<AppThemeColors>().textBlack,fontSize: 23)),
          SizedBox(height: 30,),
          Text("See the weather around the world and save your favourite locations",style: TextStyle(color: locator<AppThemeColors>().grey,fontSize: 18),textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          BlocListener<HomeBloc,HomeState>(
            bloc: homBloc,
            listener: (context,state) {
              if (state.position.latitude.toString() != null &&
                  state.position.longitude.toString() != null) {
                DateTime now = DateTime.now();
                DateTime now2 = DateTime(
                    now.year, now.month, now.day, now.hour, now.minute);
                String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                String formattedDate2 = DateFormat('yyyy-MM-dd hh:mm:ss')
                    .format(now2);
                DateTime now3 = DateTime(now.year, now.month, now.day, 0);
                String formattedDate3 = DateFormat('yyyy-MM-dd hh:mm:ss')
                    .format(now3);
                print("aaaa${formattedDate}");
                // homeBloc.setWeatherHourly(lat:'33.5102',long: '36.29128',start:formattedDate,end:formattedDate);
                String firstDayOfMonth = DateFormat('yyyy-MM-dd').format(
                    DateTime(now.year, now.month, now.day));
                String lastDayOfMonth = DateFormat('yyyy-MM-dd').format(
                    DateTime(now.year, now.month + 1, 0));
                print("firstDayOfMonth${firstDayOfMonth}");
                // homeBloc.setWeatherDaily(lat:'33.5102',long: '36.29128',start: firstDayOfMonth,end: lastDayOfMonth);
                homBloc.setDataWeather(
                    lat: homBloc.state?.position?.latitude.toString() ??
                        '33.5102',
                    long: homBloc.state.position?.longitude.toString() ??
                        '36.29128',
                    start: formattedDate,
                    endDate: lastDayOfMonth,
                    endTime: formattedDate,
                    currentDate: DateFormat('yyyy-MM-dd hh:mm:ss').format(now));
              }

            },

              child: FlatButton(onPressed: (){
                homBloc.add(getMyLocation());

              }, child: TextTranslation(TranslationsKeys.MyLocation),color: locator<AppThemeColors>().lightblue),
    )

        ],
      ),
    );
  }
}