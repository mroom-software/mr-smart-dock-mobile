import 'package:flutter/material.dart';

class ButtonIconWidget extends StatefulWidget {

  final Function onPressed;
  final String title;
  final IconData icon; 

  const ButtonIconWidget({
    Key key, 
    @required this.onPressed, 
    @required this.title,
    this.icon}) : super(key: key);

  @override
  _ButtonIconWidgetState createState() => _ButtonIconWidgetState();
}

class _ButtonIconWidgetState extends State<ButtonIconWidget> {

  Widget _buildText() {
    if (widget.icon == null) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ), 
      );
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ), 
    );
  }

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
          if(widget.onPressed != null) {
            widget.onPressed();
          }
        },
        child: _buildText(),
      ),
    );
  }
}