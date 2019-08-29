
import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/widgets/button_icon_widget.dart';

class SetupWifiWidget extends StatefulWidget {

  final String title;
  final String description;

  SetupWifiWidget({Key key, 
  @required this.title, 
  @required this.description}) : super(key: key);

  @override
  _SetupWifiWidgetState createState() => _SetupWifiWidgetState();
}

class _SetupWifiWidgetState extends State<SetupWifiWidget> {

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
                height: 60,
              ),
              Text(
                widget.description
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonIconWidget(
                  title: 'FINISH',
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}