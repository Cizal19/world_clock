import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Kathmandu', flag: "Nepal.png", url: "/Asia/Kathmandu");
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50.0),
      child: Text(time),
    ));
  }
}