import 'package:flutter/material.dart';


class LocationDetail extends StatelessWidget {
  String _name = "ayy";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green)
          ),
          padding: EdgeInsets.all(8),
          child: Text('Ayyyyyy :D')
        ),
        Container (
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('This the first item'),
              Text('This the second lol')
            ]
          )
        )
      ],
    );
  }

}