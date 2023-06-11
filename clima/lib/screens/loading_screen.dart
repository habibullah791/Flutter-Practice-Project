import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  Future<void> getLocation() async {

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('position $position');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Geo Location'),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            getLocation();
          },
          child: const Text('Get Location !'),
        ),
      ),
    );
  }
}
