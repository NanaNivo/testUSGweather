import 'package:flutter/material.dart';
import 'package:testusg/app+injection/di.dart';
import 'package:testusg/core/blocs/application_bloc/app_bloc.dart';
import 'package:testusg/core/localization/app_lang.dart';
import 'package:testusg/core/resources/colors.dart';
import 'package:intl/intl.dart';
import 'package:testusg/core/resources/constants.dart';
import 'package:testusg/presentation/custom_widgets/text_translation.dart';
import 'package:testusg/presentation/hom_flow/bloc/bloc_home.dart';
import 'package:testusg/presentation/hom_flow/bloc/state_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherSetting extends StatefulWidget
{
  @override
  State<WeatherSetting> createState() => _WeatherSettingState();
}

class _WeatherSettingState extends State<WeatherSetting> {
  List<bool> _isSelected = [false, false];
  bool _switchValue = false;
  bool _switchValue2=false;
  final homeBloc=locator<HomeBloc>();
  final appBloc=locator<AppBloc>();
  Map<AppThemeMode, String> options={} ;
  // @override
  // void initState() {
  //
  //
  //   };
   // [TranslationsKeys.Dark.tr(context),TranslationsKeys.light.tr(context)];
 // }
  @override
  Widget build(BuildContext context) {
    options ={
      AppThemeMode.dark: TranslationsKeys.Dark.tr(context),
    AppThemeMode.light: TranslationsKeys.light.tr(context),};
    return Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
    //      SwitchListTile(
    //      title: Text('Activate Choice'),
    //   subtitle: Text('Enable this switch to activate the choice.'),
    //   value: _switchValue,
    //   onChanged: (bool value) {
    //     setState(() {
    //       _switchValue = value;
    //     });
    //   },
    // ),
             BlocBuilder<HomeBloc,HomeState>(
               bloc: homeBloc,
               builder: (context,state) {
                 return Container(
                   padding:  EdgeInsets.symmetric(
                     vertical: ScreenUtil().setHeight(12),),
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
                     children: [
                       TextTranslation(TranslationsKeys.Degree,style: TextStyle(color:locator<AppThemeColors>().textBlack ),),
                       Row(children: [
                         FlatButton(onPressed: (){
      // setState(() {
      //             _switchValue = !_switchValue;
      //       });
                        //   homeBloc.setWeatherUtils(Utils.metric);
                           DateTime now = DateTime.now();
                           String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                           String firstDayOfMonth = DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, now.day));
                           String lastDayOfMonth =DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month + 1, 0));
                           homeBloc.setDataWeather(lat: '33.5102',long: '36.29128',start:formattedDate,endDate:lastDayOfMonth,endTime: formattedDate,currentDate: DateFormat('yyyy-MM-dd hh:mm:ss').format(now) ,units: 'metric' );
                         }, child: TextTranslation(TranslationsKeys.C,style: TextStyle(color:locator<AppThemeColors>().textBlack)),color:state.utils.name==Utils.metric.name?locator<AppThemeColors>().lightblue:locator<AppThemeColors>().ContainerColor,),
                         FlatButton(onPressed: (){
                          // setState(() {
                            // _switchValue = !_switchValue;
                         //  homeBloc.setWeatherUtils(Utils.imperial);
                             DateTime now = DateTime.now();
                             String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                             String firstDayOfMonth = DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, now.day));
                             String lastDayOfMonth =DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month + 1, 0));
                             homeBloc.setDataWeather(lat: '33.5102',long: '36.29128',start:formattedDate,endDate:lastDayOfMonth,endTime: formattedDate,currentDate: DateFormat('yyyy-MM-dd hh:mm:ss').format(now) ,units: 'imperial' );
                         //  });
                         }, child: TextTranslation(TranslationsKeys.F,style: TextStyle(color:locator<AppThemeColors>().textBlack)),color:state.utils.name==Utils.imperial.name? locator<AppThemeColors>().lightblue:locator<AppThemeColors>().ContainerColor,)
                       ],),
                     ],
                   ),
                 );
               }
             ),
             SizedBox(height: 30,),

             BlocBuilder<AppBloc,AppState>(
                 bloc: appBloc,
                 builder: (context,state) {
                   return Container(
                     width: ScreenUtil().screenWidth,
                     height: ScreenUtil().setHeight(600),
                     padding:  EdgeInsets.symmetric(
                       vertical: ScreenUtil().setHeight(12),),
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
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             TextTranslation(TranslationsKeys.Language),
                             Row(children: [
                               FlatButton(onPressed: (){
                                 appBloc.add(AppLanguageEvent(AppLanguages.ar));

                               }, child: TextTranslation(TranslationsKeys.AR,style: TextStyle(color:locator<AppThemeColors>().textBlack)),color:state.language.name==AppLanguages.ar.name?locator<AppThemeColors>().lightblue:locator<AppThemeColors>().ContainerColor,),
                               FlatButton(onPressed: (){
                                 appBloc.add(AppLanguageEvent(AppLanguages.en));

                               }, child: TextTranslation(TranslationsKeys.EN,style: TextStyle(color:locator<AppThemeColors>().textBlack)),color:state.language.name==AppLanguages.en.name? locator<AppThemeColors>().lightblue:locator<AppThemeColors>().ContainerColor,)
                             ],),
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Flexible(flex: 1,child: TextTranslation(TranslationsKeys.Them)),

                     Flexible(
                       flex: 2,
                       child: Row(
                         children: [
                           Flexible(flex: 3,child: Container()),

                           Flexible(
                             flex: 3,
                             child: DropdownButton<int>(
                               value: state.appThemeMode.index,
                               underline: null,
                               items: options.entries
                                   .map<DropdownMenuItem<int>>((MapEntry<AppThemeMode, String> value) {
                                 return DropdownMenuItem<int>(
                                   value: value.key.index,
                                   child: Text(value.value),
                                 );
                               }).toList(),
                               onChanged: (int newValue) {
                                 // setState(() {
                                 //   selectedOption = newValue;
                                 // });

                                 appBloc.add(AppThemeModeEvent(appThemeMode:AppThemeMode.values[newValue]));
                               },
                             ),
                           ),
                         ],
                       ),
                     ),
                           ],
                         ),
                       ],
                     ),
                   );
                 }
             ),

         ],),
    );
  }
}