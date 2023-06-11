import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:location/location.dart';


Location location = Location();

bool _serviceEnabled = false;
PermissionStatus _permissionGranted = false as PermissionStatus;
LocationData _locationData = false as LocationData;


Future<dynamic> getLocation() async{
  _serviceEnabled = await location.serviceEnabled();
  if(!_serviceEnabled){
    _serviceEnabled = await location.requestService();
  }
  _permissionGranted = await location.hasPermission();
  if(_permissionGranted == PermissionStatus.denied){
    _permissionGranted = await location.requestPermission();
  }
  _locationData = await location.getLocation();

  print(_locationData.altitude);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Locator'),
          ),
        ),
        body: Center(
          child: FloatingActionButton(
            onPressed: getLocation,
            child: Text('get'),
          ),
        )
      ),
    );
  }
}
