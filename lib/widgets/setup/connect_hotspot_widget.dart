import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/widgets/common/button_widget.dart';

class ConnectHotspotWidget extends StatefulWidget {

  final String title;
  final String description;
  final String imgName;
  final Function onCallback;

  ConnectHotspotWidget({Key key, 
  @required this.title, 
  @required this.description,
  @required this.imgName,
  this.onCallback}) : super(key: key);


  @override
  _ConnectHotspotWidgetState createState() => _ConnectHotspotWidgetState();
}

class _ConnectHotspotWidgetState extends State<ConnectHotspotWidget> {

  @override
  void initState() {
    super.initState();
  }


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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ] 
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                widget.description
              ),
              SizedBox(
                height: 45,
              ),
              Image.asset(widget.imgName),
              SizedBox(
                height: 45,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonWidget(
                  title: 'NEXT',
                  onPressed: (widget.onCallback != null) ? widget.onCallback : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}