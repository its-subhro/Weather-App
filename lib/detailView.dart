// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class WeatherCardScreen extends StatefulWidget {
  var data;
  WeatherCardScreen({super.key, required this.data});

  @override
  State<WeatherCardScreen> createState() => _WeatherCardScreenState();
}

class _WeatherCardScreenState extends State<WeatherCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data['name'],
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  'http://openweathermap.org/img/w/${widget.data['weather'][0]['icon']}.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                '${(widget.data['main']['temp'] - 273).toInt()}°',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                getDayOfWeek(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Humidity',style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.data['main']['humidity'].toString()}%',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Wind',style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${(widget.data['wind']['speed'] * 3.6).toInt()} km/hr',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getDayOfWeek() {
    DateTime now = DateTime.now();
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[now.weekday - 1];
  }
}
