import 'package:flutter/material.dart';
import 'package:workout_app/layout/log/workout_log.dart';
import 'package:workout_app/location_detail.dart';

import 'app_theme.dart';

void main() => runApp(MaterialApp(
    theme: AppTheme.getTheme(),

    home: Scaffold(

//    backgroundColor: Color(000),
    body: SafeArea(child: WorkoutLog()),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Workout Log')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.alarm_on),
            title: Text('Workout Log')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('Profile')
        )
      ]
    )
  )
));


