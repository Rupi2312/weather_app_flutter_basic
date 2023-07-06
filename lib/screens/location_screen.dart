
import 'package:flutter/material.dart';
import 'package:untitled1/screens/city_screen.dart';

import '../services/weather.dart';
class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late int temperature;
  late String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);

  }


  void updateUI(dynamic locationWeather){

    setState(() {


      if(locationWeather==null){
        temperature=0;
        cityName=" ";
        return ;
      }
      double temp= locationWeather['main']['temp'];// main.temp
      temperature= temp.toInt();
      cityName= locationWeather['name'];
      print(cityName );
      print(temperature);

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () async {

            WeatherModel weatherModel= WeatherModel();

            var weatherData= await weatherModel.getLocationWeather();
            updateUI(weatherData);


          },
              child: Icon(
            Icons.near_me,size: 50,
          )) ,

ElevatedButton(onPressed: () async {
  var typedName= await Navigator.push(context,
      MaterialPageRoute(
      builder: (context){
    return CityScreen();
  },
  )
  );


  if(typedName !=null){

    WeatherModel weatherModel= WeatherModel();
    var weatherData=await weatherModel.getLocationByCityName(typedName);
    updateUI(weatherData);



  }
}, child: Icon(
  Icons.location_city, size: 50.0,
)),
          Text('$cityName',style: TextStyle(fontSize: 30,fontWeight:FontWeight.w100,color: Colors.orange),),
          Text('$temperature',style: TextStyle(fontSize: 60,fontWeight:FontWeight.w500,color: Colors.blue),),
        ],
      )
    );
  }
}
