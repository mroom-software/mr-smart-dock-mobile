import 'package:flutter/material.dart';

class ActiveSmartDockWidget extends StatefulWidget {
  final String title;
  final String description;
  final String imgName;

  ActiveSmartDockWidget({Key key, 
  @required this.title, 
  @required this.description,
  @required this.imgName}) : super(key: key);

  @override
  _ActiveSmartDockWidgetState createState() => _ActiveSmartDockWidgetState();
}

class _ActiveSmartDockWidgetState extends State<ActiveSmartDockWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SETUP',
          style: Theme.of(context).textTheme.headline,
        ),
        elevation: 0.5,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                widget.title
              ),
              Text(
                widget.description
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(widget.imgName),
          ),
        ],
      ),
    );
  }
}