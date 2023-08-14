import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Timer App",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int iCount = 10;
  int count = 10;
  Timer? timer;
  bool isRunning = false;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        timer.cancel();
        setState(() {
          isRunning = false;
        });
      }
    });
  }

  stopTimer() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  resetTimer () {
    timer?.cancel();
    setState(() {
      count = iCount;
      isRunning = false;
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Timer app",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  iCount = int.parse(val);
                });
              },
              enabled: !isRunning,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Seconds',
                hintStyle: TextStyle(
                  fontSize: 20.0,
                ),
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                ),
              ),
              maxLength: 6,
              keyboardType: TextInputType.number,
            ),
            
              