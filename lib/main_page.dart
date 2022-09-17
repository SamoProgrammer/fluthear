// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:fluthear/choose_city.dart';
import 'package:fluthear/seven_days.dart';
import 'package:flutter/material.dart';
import 'package:fluthear/widgets/day_weather_card.dart';
// import 'api/api_service.dart';
// import 'api/models/current_weather_model.dart';
import 'package:weather/weather.dart';
import 'api/open_weather.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Weather? _currentWeatherModel;
  double? temprature = 0;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _currentWeatherModel = await OpenWeather().getCurrentOpenWeather('Mashhad');
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          children: [
            Container(
              height: 625,
              margin: EdgeInsets.only(left: 9, top: 9, right: 9),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 18, 180, 252),
                        Color.fromARGB(255, 17, 105, 243),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
              child: Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SevenDaysPage()));
                            },
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    color: Color.fromARGB(120, 255, 255, 255)),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(18),
                                primary: Colors.transparent,
                                onPrimary: Colors.transparent),
                            child: Icon(
                              Icons.workspaces_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.location_on,
                                  size: 26,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChooseCityPage()),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text('Minsk',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white)),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Colors.transparent),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16),
                                primary: Colors.transparent,
                                onPrimary: Colors.transparent),
                            child: Icon(Icons.more_vert,
                                color: Colors.white, size: 28),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 70,
                        child: Visibility(
                            child: OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(5),
                            primary: Color.fromARGB(255, 19, 166, 254),
                            onPrimary: Color.fromARGB(255, 19, 166, 254),
                          ),
                          child: Center(
                            child: Text(
                              'Updating',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        )),
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          height: 250,
                          child: Image.asset(
                              'assets/images/lightining_cloud.png')),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 145,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                '${_currentWeatherModel!.temperature!.celsius!.toInt()}°',
                                // '21°',
                                style: TextStyle(
                                    fontSize: 130,
                                    fontFamily: 'Vitro',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 0.75),
                              ),
                              Text(
                                _currentWeatherModel!.weatherDescription!,
                                // 'Thunderstorm',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              Text(
                                // _currentWeatherModel!.date!.hour.toString(),
                                'Monday',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 155, 200, 246)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 30),
                        child: Container(
                          height: 1,
                          color: Color.fromARGB(50, 255, 255, 255),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.wind_power,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${_currentWeatherModel!.windSpeed!} m/s',
                                  // '2.6 km/h',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(130, 255, 255, 255)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${_currentWeatherModel!.humidity!}%',
                                  // '23%',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(130, 255, 255, 255)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${_currentWeatherModel!.cloudiness!}%',
                                  // '20%',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Cloudiness',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(130, 255, 255, 255)),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '7 days >',
                    style: TextStyle(
                        color: Color.fromARGB(120, 255, 255, 255),
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DayWeatherCard(temperature: '25'),
                    DayWeatherCard(
                      temperature: '12',
                      isToday: true,
                    ),
                    DayWeatherCard(),
                    DayWeatherCard(
                      temperature: '16',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
      backgroundColor: Color.fromARGB(255, 1, 12, 29),
    );
  }
}
