
import 'package:flutter/material.dart';
class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}
String cityName='';
class _CityScreenState extends State<CityScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child:Icon(
            Icons.arrow_back,size: 50.0,
          ) ),

          TextField(
            onChanged: (value){
              cityName=value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.amberAccent,
              icon: Icon(Icons.location_city),
              hintText: 'ENter city name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              )

            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context,cityName);
          }, child: Text('Get weather', style: TextStyle(fontWeight: FontWeight.w300),))


        ],
      ),
    );
  }
}
