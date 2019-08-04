import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.0, 1.0],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Color(0xFFFE9B86),
            Color(0xFFF15887),
          ],
        ),
      ),
      child: FlatButton(
        onPressed: () {
          
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.access_alarms,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'SIGN UP',
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ), 
        ),
      ),
    );
  }

}