import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const MenuButton({Key key, this.icon, this.backgroundColor, this.iconColor, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: Ink(
          decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: this.backgroundColor
          ),
          child: IconButton(
            icon: this.icon,
            color: this.iconColor,
            onPressed: this.onPressed,
          )
      )
    );
  }
}

///
///
///
///
///
///
class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Stack(
      children: [
        Positioned(
          top: 0.0,
          right: 0.0,
          left: 0.0,
          bottom: 0.0,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/gym-background.jpg"), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.grey[800].withOpacity(0.3), BlendMode.dstATop)),
                  border: Border(bottom: BorderSide(color: Colors.grey[600]))
              ),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(4),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Container (
//                  color: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 16),

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [

                                      MenuButton(onPressed: () => print("ayyy"), icon: Icon(Icons.search), backgroundColor: Colors.grey[600], iconColor: Colors.black,),
                                      SizedBox(width: 8),
                                      MenuButton(onPressed: () => print("ayyy"), icon: Icon(Icons.calendar_today), backgroundColor: Colors.grey[600], iconColor: Colors.black,),
                                    ]
                                )
                            ),
                          ),


                          RaisedButton(child: Text("Spotify"), color: Colors.green, onPressed: () => {})
                        ]
                    )
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Program Name", style: Theme.of(context).textTheme.headline),
                      Text("By Scruffy Mcguff")
                    ]
                )
              ]
          )
        ),
      ]
    );
  }
}