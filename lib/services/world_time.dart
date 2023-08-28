import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset url flag icon
  late String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // make the request
    Response res =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(res.body);
    // print(data);

    // get properties from data
    String datetime = data["datetime"]; // .substring(0,25)
    // print(datetime);
    // print(offset);
    DateTime now = DateTime.parse(datetime);

    // set the time property
    time = now.toString();

    // print(time);
  }
}
