import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset url flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response res =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(res.body);
      // print(data);

      // get properties from data
      String datetime = data["datetime"].substring(0, 25);

      DateTime now = DateTime.parse(datetime);

      // set the time property
      time = DateFormat.jm().format(now);

      isDaytime = now.hour > 6 && now.hour < 20;
    } catch (e) {
      print("caught error: $e");
      time = "could not get time data";
    }
  }
}
