
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled1/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled1/services/weather.dart';
import 'location_screen.dart';
const apiKey='9a23df3cd126eade2d3bc03815ccd327';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocationData();

  }

  void getLocationData() async {


  WeatherModel weatherModel= WeatherModel();

  var weatherData= await weatherModel.getLocationWeather();
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherData,);
  }));


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100.0,

        ),
      )
    );
  }
}
