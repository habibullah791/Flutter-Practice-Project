import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';


  //function for IOS Cupertino Picker
  CupertinoPicker iOSPicker(){

    List <Widget> pickerItems = [];
    for (String currency in currenciesList){
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
        itemExtent: 30.0,
        onSelectedItemChanged: (selectedItem){
          selectedCurrency = currenciesList[selectedItem];
        },
        children: pickerItems
    );
  }

  
  //function for Andriod dropDown and change the background color of the dropDown List to lightBlue
  DropdownButton<String> androidDropDown(){

    List <DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList){
      dropDownItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value){
        setState(() {
          selectedCurrency = value!;
        });
      },
    );
  }

  Widget getPicker(){
    if(Platform.isIOS){
      return iOSPicker();
    }
      return androidDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue ,
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,

            // enlist all the currencies in a cupertino picker widget
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}