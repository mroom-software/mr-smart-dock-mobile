import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';
import 'package:smart_dock_mobile/widgets/common/button_widget.dart';

class SetWorkingHoursWidget extends StatefulWidget {

  final String title;
  final String desc;
  final Function({int action, dynamic value}) onCallback;

  const SetWorkingHoursWidget({Key key, 
    @required this.title, 
    @required this.desc, 
    @required this.onCallback}) : super(key: key);

  @override
  _SetWorkingHoursWidgetState createState() => _SetWorkingHoursWidgetState();
}

class _SetWorkingHoursWidgetState extends State<SetWorkingHoursWidget> {

  HomeBloc _homeBloc;
  RangeValues _values;
  
  @override
  void initState() {
    _values = RangeValues(9, 19);
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
        leading: InkWell(
          onTap: () {
            if (widget.onCallback != null) {
              widget.onCallback(
                action: -1,
                value: _values,
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
                _homeBloc.dispatch(HomeSkipProfileUpdate());
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
              child: Text(
                _workingTime(),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            RangeSlider(
              min: 6,
              max: 20,
              values: _values,
              divisions: 14,
              activeColor: Colors.blue,
              labels: RangeLabels(_formatTime(_values.start.round()), _formatTime(_values.end.round())),
              onChanged: (RangeValues values) {
                if (values.end - values.start >= 1) {
                  setState(() {
                    _values = values;
                  });
                  
                } else {
                  if (_values.start == values.start) {
                    setState(() {
                      _values = RangeValues(_values.start, _values.start + 1);
                    });
                    
                  } else {
                     setState(() {
                       _values = RangeValues(_values.end - 1, _values.end);
                     });
                  }
                }
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
                      value: '',
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

  String _formatTime(int time) {
    if (time < 12) {
      return '$time AM';
    }
    return '$time PM';
  }

  String _workingTime() {
    return _formatTime(_values.start.round()) + ' : ' + _formatTime(_values.end.round());
  }
}