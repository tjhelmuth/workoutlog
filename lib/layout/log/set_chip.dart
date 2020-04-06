import 'package:flutter/material.dart';

class SetChip extends StatelessWidget {
  final int _reps;
  final int _weight;
  final int _targetReps;
  final bool _complete;

  SetChip(this._reps, this._weight, this._complete, {targetReps}) : _targetReps = targetReps ?? -1;

//  @override
//  Widget build(BuildContext context) {
//    bool belowTarget = _reps < _targetReps;
//
//    return Theme(child: InputChip(
////      backgroundColor: Colors.blue,
////      shadowColor: Colors.grey[800],
////      selectedShadowColor: Colors.red,
////      selectedColor: Colors.red,
//      padding: EdgeInsets.all(-2),
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//      onPressed: () => print('Ayy mofuka'),
//      label: Row(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children: [
//            Text('${this._reps}', style: TextStyle(color: belowTarget ? Colors.red : Colors.green),),
//            Padding(padding: EdgeInsets.only(right: 2, left: 2), child: Text("x", style: TextStyle(fontSize: 10, color: Colors.grey[800]))),
//            Text('${this._weight} lbs', style: TextStyle(color: Colors.grey[800]))
//          ]
//      ),
//    ), data: ThemeData());
//  }

  @override
  Widget build(BuildContext context) {
    bool belowTarget = _reps < _targetReps;

    return Theme(child: Material(
      color: _complete ? Colors.grey[300] : Colors.transparent,
      elevation: 5,
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(5))),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${this._reps}', style: TextStyle(color: belowTarget ? Colors.red : Colors.green),),
              Padding(padding: EdgeInsets.only(right: 2, left: 2), child: Text("x", style: TextStyle(fontSize: 10, color: Colors.grey[800]))),
              Text('${this._weight} lbs', style: TextStyle(color: Colors.grey[800]))
            ]
          )
        ),
      ),
    ), data: ThemeData(splashColor: Colors.grey[800]));


    return Theme(child: InputChip(
//      backgroundColor: Colors.blue,
//      shadowColor: Colors.grey[800],
//      selectedShadowColor: Colors.red,
//      selectedColor: Colors.red,
      padding: EdgeInsets.all(-2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      onPressed: () => print('Ayy mofuka'),
      label: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${this._reps}', style: TextStyle(color: belowTarget ? Colors.red : Colors.green),),
            Padding(padding: EdgeInsets.only(right: 2, left: 2), child: Text("x", style: TextStyle(fontSize: 10, color: Colors.grey[800]))),
            Text('${this._weight} lbs', style: TextStyle(color: Colors.grey[800]))
          ]
      ),
    ), data: ThemeData());
  }
}