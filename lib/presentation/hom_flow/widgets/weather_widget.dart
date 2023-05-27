import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testusg/app+injection/di.dart';
import 'package:testusg/core/helper/util/Globals.dart';
import 'package:testusg/core/resources/colors.dart';
import 'package:testusg/presentation/hom_flow/bloc/bloc_home.dart';
import 'package:testusg/presentation/hom_flow/bloc/state_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatelessWidget {
  final homeBloc = locator<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if(state.weatherCurrent!=null&&state.weatherHourly!=null&&state.weatherDaily!=null) {
            return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (state.weatherCurrent != null) ...[
                Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(600),
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(80),),
                      //  vertical: ScreenUtil().setHeight(100)),
                    decoration: BoxDecoration(
                      color: locator<AppThemeColors>().ContainerColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('E, d MMM, HH:MM').format(
                                DateTime.parse(state.weatherCurrent.time),
                              ),
                              style: TextStyle(
                                  color: locator<AppThemeColors>().grey,
                                  fontSize: ScreenUtil().setSp(50)),
                            ),
                            Text("${state.weatherCurrent.temp}${state.utils==Utils.metric?'°C':'F'}",
                                style: TextStyle(
                                    color: locator<AppThemeColors>().textBlack,
                                    fontSize: ScreenUtil().setSp(90),
                                    fontWeight: FontWeight.bold)),
                            Text(
                                Globals.getWeatherStatus(
                                    state.weatherCurrent.coco),
                                style: TextStyle(
                                    color: locator<AppThemeColors>().textBlack,
                                    fontSize: ScreenUtil().setSp(50),
                                    fontWeight: FontWeight.normal)),
                            Text("Feels like ${state.weatherCurrent.temp}${state.utils==Utils.metric?'°C':'F'}",
                                style: TextStyle(
                                    color: locator<AppThemeColors>().grey,
                                    fontSize: ScreenUtil().setSp(50),
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                        Icon(
                          Globals.getWeatherIcon(
                            state.weatherCurrent.coco,
                          ),
                          size: ScreenUtil().setWidth(260),
                          color: locator<AppThemeColors>().black,
                        ),
                      ],
                    ))
              ],
              if (state?.weatherHourly?.data?.isNotEmpty) ...[
                Container(
                  height: ScreenUtil().setHeight(300),
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(80)),
                  child: ListView.builder(
                      itemCount: state.weatherHourly.data.length,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(200),
                              height: ScreenUtil().setHeight(150),
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30),
                                  vertical: ScreenUtil().setHeight(10)),
                              decoration: BoxDecoration(
                                color: locator<AppThemeColors>().ContainerColor,
                                borderRadius: BorderRadius.circular(8),
                                // border: Border.all(
                                //   // color: Colors.grey,
                                //   // width: 2,
                                //
                                // ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Globals.getWeatherIcon(
                                  state.weatherHourly.data[index].coco,
                                ),
                                color: locator<AppThemeColors>().black,
                              ),
                            ),
                            Text(
                              DateFormat('hh:MM')
                                  .format(DateTime.parse(
                                      state.weatherHourly.data[index].time))
                                  .toString(),
                              style: TextStyle(
                                  color: locator<AppThemeColors>().grey),
                            ),
                            Text(
                              "${state.weatherHourly.data[index].temp}${state.utils==Utils.metric?'°C':'F'}",
                              style: TextStyle(
                                  color: locator<AppThemeColors>().black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        );
                      }),
                )
              ],
              if (state?.weatherDaily?.data?.isNotEmpty) ...[
                Container(
                  height: ScreenUtil().screenHeight / 2.5,
                  width: ScreenUtil().screenWidth,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: state.weatherDaily.data.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(160) ,
                           height:ScreenUtil().setWidth(160) ,
                           margin:EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)) ,
                           //   padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(80),vertical: ScreenUtil().setHeight(35)),
                        decoration: BoxDecoration(
                        color: locator<AppThemeColors>().ContainerColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                        ),
                        ],),
                                child: Icon(Globals.getWeatherIcon(state.weatherDaily.data[index].coco),  color: locator<AppThemeColors>().black,)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DateFormat('E, d MMM').format(
                                    DateTime.parse(
                                        state.weatherDaily.data[index].date))),
                                Text(Globals.getWeatherStatus(state.weatherDaily.data[index].coco),style: TextStyle(color: locator<AppThemeColors>().grey),),

                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: ScreenUtil().setWidth(300),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${state.weatherDaily.data[index].tmin}${state.utils==Utils.metric?'°C':'F'}",
                                        style: TextStyle(
                                            color:
                                                locator<AppThemeColors>().grey),
                                      ),
                                      Text(
                                          "${state.weatherDaily.data[index].tmax}${state.utils==Utils.metric?'°C':'F'}",
                                          style: TextStyle(
                                              color: locator<AppThemeColors>()
                                                  .black)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: ScreenUtil().setWidth(300),
                                  height: ScreenUtil().setHeight(16),
                                  decoration: BoxDecoration(
                                    color: locator<AppThemeColors>().lightblue,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: LinearProgressIndicator(
                                 minHeight: ScreenUtil().setHeight(14),

                                    backgroundColor: locator<AppThemeColors>().grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(locator<AppThemeColors>().primaryColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                )
              ]
            ],
          );
          }
          return CircularProgressIndicator();
        });
  }
}
