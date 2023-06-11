import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:  Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Center(
          child: Text('Yo Bitch'),
        ),
        backgroundColor: Colors.blueGrey[900]
      ),
      body: Center(
        child:  Image(
            image:AssetImage('images/download.jpg')
        ),
      )
    ),
  ),);
}