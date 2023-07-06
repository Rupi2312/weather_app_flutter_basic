

import 'package:untitled1/screens/city_screen.dart';
import 'package:untitled1/services/location.dart';
import 'package:untitled1/services/networking.dart';



const apiKey='9a23df3cd126eade2d3bc03815ccd327';
class WeatherModel{


  Future<dynamic> getLocationWeather() async {

    Location location=Location();
    await location.getLocation();


    NetworkHelper networkHelper= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData= await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationByCityName(var cityName) async{
    NetworkHelper networkHelper= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData= await networkHelper.getData();
    return weatherData;
  }
}