import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';
import 'package:smart_dock_mobile/widgets/common/button_widget.dart';

class SetWeightHeightWidget extends StatefulWidget {

  final String title;
  final String desc;
  final String unit;
  final Function({int action, dynamic value}) onCallback;

  const SetWeightHeightWidget({Key key, 
    @required this.title, 
    @required this.desc, 
    @required this.unit, 
    @required this.onCallback}) : super(key: key);


  @override
  _SetWeightHeightWidgetState createState() => _SetWeightHeightWidgetState();
}

class _SetWeightHeightWidgetState extends State<SetWeightHeightWidget> {
  HomeBloc _homeBloc;
  double _value, _min, _max;

  @override
  void initState() {
    _calculateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'PROFILE',
          style: Theme.of(context).textTheme.headline,
        ),
        elevation: 0.5,
        leading: (widget.unit == 'kg') ? null : InkWell(
          onTap: () {
            if (widget.onCallback != null) {
              widget.onCallback(
                action: -1,
                value: _value,
              );
            }
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                _homeBloc.add(HomeSkipProfileUpdate());
              },
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ] 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Center(
              child: Text(
                widget.desc,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: '${_value.toInt()} ',
                  style: Theme.of(context).textTheme.title,
                  children: <TextSpan>[
                    TextSpan(text: widget.unit, style: Theme.of(context).textTheme.subtitle),
                  ],
                ),
              ),
            ),
            Slider(
              value: _value,
              min: _min,
              max: _max,
              divisions: _max.toInt() - _min.toInt(),
              activeColor: Colors.blue,
              label: _value.toInt().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ButtonWidget(
                title: 'NEXT',
                onPressed: () {
                  if(widget.onCallback != null) {
                    widget.onCallback(
                      action: 1,
                      value: _value,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateData() {
    if (widget.unit == 'kg') {
      _value = 70;
      _min = 30;
      _max = 120;

    } else {
      _value = 170;
      _min = 100;
      _max = 200;
    }
    
  }
}