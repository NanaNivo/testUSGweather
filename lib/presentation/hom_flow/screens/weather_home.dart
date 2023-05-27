import 'package:flutter/material.dart';
import 'package:testusg/app+injection/di.dart';
import 'package:testusg/core/localization/app_lang.dart';
import 'package:testusg/core/resources/colors.dart';
import 'package:testusg/core/resources/constants.dart';
import 'package:testusg/presentation/custom_widgets/loader_button.dart';
import 'package:testusg/presentation/custom_widgets/text_translation.dart';
import 'package:testusg/presentation/hom_flow/bloc/bloc_home.dart';
import 'package:testusg/presentation/hom_flow/widgets/weather_location.dart';
import 'package:testusg/presentation/hom_flow/widgets/weather_setting.dart';
import 'package:testusg/presentation/hom_flow/widgets/weather_widget.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
class WeatherHome extends StatefulWidget
{
  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  int _selectedIndex = 0;
  final homeBloc=locator<HomeBloc>();

  @override
  void initState() {
    //homeBloc.setDataWeather();

  }
    List<Widget> _widgetOptions = <Widget>[
      WeatherLocation(),
    WeatherWidget(),
      WeatherSetting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // Column(
      //   children:
      //     [
      //       TextTranslation("Right Clothes,no bad weather"),
      //       TextTranslation("see the weather around the word and save your favourite locations"),
      //     FloatingActionButton(onPressed: (){
      //
      //     },child: Text("Find location",),backgroundColor: locator<AppThemeColors>().primaryColor,
      // ),
    //  ]),
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: TranslationsKeys.MyLocation.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(WeatherIcons.cloudy,color: locator<AppThemeColors>().grey
              ,),
            label: TranslationsKeys.Weather.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: TranslationsKeys.setting.tr(context),
          ),
        ],
      ),

    );
  }
}